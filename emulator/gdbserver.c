#include <sys/socket.h>
#include <arpa/inet.h>
#include <string.h>
#include <stdio.h>
#include <unistd.h>
#include "gdbserver.h"
#include "m68k.h"
#include "emulator.h"

int gdbs_await_client(int port) {
    int lsock = socket(AF_INET, SOCK_STREAM, 0);
    if (lsock < 0) {
        return -1;
    }

    struct sockaddr_in laddr;
    memset(&laddr, 0, sizeof(laddr));

    laddr.sin_family = AF_INET;
    laddr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
    laddr.sin_port = htons(port);

    int bound = bind(lsock, (struct sockaddr*)&laddr, sizeof(laddr));
    if (bound < 0) {
        shutdown(lsock, 2);
        return -1;
    }

    int listening = listen(lsock, 0);
    if (listening < 0) {
        shutdown(lsock, 2);
        return -1;
    }

    int csock = accept(lsock, NULL, NULL);
    if (csock < 0) {
        shutdown(lsock, 2);
        return -1;
    }

    return csock;
}

int gdbs_write_packet(int csock, char *data, int ack) {
    int checksum = 0;
    for (char *c = data; *c != 0; c++) {
        checksum += *c;
    }
    checksum &= 0xff;

    return dprintf(csock, "%s$%s#%02x", (ack ? "+" : ""), data, checksum);
}

int gdbs_read_packet(int csock, char *buf, int maxlen) {
    char c = '\0';
    int result;
    int readlen = 0;

    // Keep reading single bytes until we find a $ that signals the start
    // of a command.
    while (c != '$') {
        result = read(csock, &c, 1);
        if (result < 1) {
            return -1;
        }
    }

    while (c != '#') {
        if (readlen == (maxlen-1)) {
            break;
        }
        size_t result = read(csock, &c, 1);
        if (result < 1) {
            return -1;
        }

        if (c == '#') {
            break;
        }

        buf[readlen] = c;
        readlen++;
    }

    // Now we have a two byte checksum which we'll read but otherwise
    // ignore, since we're using TCP and it is reliable.
    result = read(csock, &c, 1);
    if (result < 1) {
        return -1;
    }
    result = read(csock, &c, 1);
    if (result < 1) {
        return -1;
    }

    buf[readlen] = '\0';
    return readlen;
}

int gdbs_handle_command(int csock) {
    // This is a very simplistic, non-optimized and not very fault tolerant
    // implementation. Might revisit if it becomes problematic, but for
    // now simpler is better.

    char packet[256];
    int result = gdbs_read_packet(csock, (char*)&packet, sizeof(packet));
    if (result < 0) {
        return 0;
    }

    Mode new_mode = READ;
    char cmd = packet[0];

    switch (cmd) {
    case 'g': // read registers
        0;
        char regstr[168] = {0};
        snprintf(
            regstr, sizeof(regstr),
            "%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x",
            m68k_get_reg(NULL, M68K_REG_D0),
            m68k_get_reg(NULL, M68K_REG_D1),
            m68k_get_reg(NULL, M68K_REG_D2),
            m68k_get_reg(NULL, M68K_REG_D3),
            m68k_get_reg(NULL, M68K_REG_D4),
            m68k_get_reg(NULL, M68K_REG_D5),
            m68k_get_reg(NULL, M68K_REG_D6),
            m68k_get_reg(NULL, M68K_REG_D7),
            m68k_get_reg(NULL, M68K_REG_A0),
            m68k_get_reg(NULL, M68K_REG_A1),
            m68k_get_reg(NULL, M68K_REG_A2),
            m68k_get_reg(NULL, M68K_REG_A3),
            m68k_get_reg(NULL, M68K_REG_A4),
            m68k_get_reg(NULL, M68K_REG_A5),
            m68k_get_reg(NULL, M68K_REG_A6),
            m68k_get_reg(NULL, M68K_REG_A7),
            m68k_get_reg(NULL, M68K_REG_SR),
            m68k_get_reg(NULL, M68K_REG_PC)
        );
        result = gdbs_write_packet(csock, regstr, 1);
        if (result < 0) {
            perror("Error writing to GDB socket");
            return EXIT;
        }
        break;

    case 'v': // extended packets
        if (strncmp("vCont;", packet, 6) == 0) {
            char action = packet[6];
            switch (action) {
            case 'c':
                new_mode = RUN;
                break;
            case 's':
                new_mode = STEP;
                break;
            case 't':
                new_mode = EXIT;
                break;
            default:
                // Unsupported action
                fprintf(stderr, "Invalid vCont action %c\n", action);
                result = gdbs_write_packet(csock, "E04", 1);
                if (result < 0) {
                    perror("Error writing to GDB socket");
                    return EXIT;
                }
                break;
            }
            result = gdbs_write_packet(csock, "", 1);
            if (result < 0) {
                perror("Error writing to GDB socket");
                return EXIT;
            }
        }
        else {
            // Unsupported packet
            result = gdbs_write_packet(csock, "E03", 1);
            if (result < 0) {
                perror("Error writing to GDB socket");
                return EXIT;
            }
        }
        break;

    case 'H': // set thread id
        // We don't have threads, so this is a no-op.
        result = gdbs_write_packet(csock, "OK", 1);
        if (result < 0) {
            perror("Error writing to GDB socket");
            return EXIT;
        }
        break;

    case 'q': // general query
        if (strcmp("qC", packet) == 0) {
            // We only have one thread
            result = gdbs_write_packet(csock, "QC 1", 1);
            if (result < 0) {
                perror("Error writing to GDB socket");
                return EXIT;
            }
        }
        else if (strcmp("qAttached", packet) == 0) {
            result = gdbs_write_packet(csock, "1", 1);
            if (result < 0) {
                perror("Error writing to GDB socket");
                return EXIT;
            }
        }
        else if (strcmp("qSymbol", packet) == 0) {
            result = gdbs_write_packet(csock, "OK", 1);
            if (result < 0) {
                perror("Error writing to GDB socket");
                return EXIT;
            }
        }
        else if (strncmp("qSupported:", packet, 11) == 0) {
            // We don't support any extensions
            result = gdbs_write_packet(csock, "", 1);
            if (result < 0) {
                perror("Error writing to GDB socket");
                return EXIT;
            }
        }
        else if (strcmp("qfThreadInfo", packet) == 0) {
            result = gdbs_write_packet(csock, "m 1", 1);
            if (result < 0) {
                perror("Error writing to GDB socket");
                return EXIT;
            }
        }
        else if (strcmp("qsThreadInfo", packet) == 0) {
            result = gdbs_write_packet(csock, "l", 1);
            if (result < 0) {
                perror("Error writing to GDB socket");
                return EXIT;
            }
        }
        else {
            // Unknown query
            result = gdbs_write_packet(csock, "", 1);
            if (result < 0) {
                perror("Error writing to GDB socket");
                return EXIT;
            }
            break;
        }

        break;

    default: // unknown command
        result = gdbs_write_packet(csock, "E01", 1);
        if (result < 0) {
            perror("Error writing to GDB socket");
            return EXIT;
        }
        break;
    }

    return new_mode;
}

