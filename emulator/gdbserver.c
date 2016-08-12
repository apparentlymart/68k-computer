#include <sys/socket.h>
#include <arpa/inet.h>
#include <string.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include "gdbserver.h"
#include "m68k.h"
#include "emulator.h"
#include "mmu.h"
#include "memory.h"

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

// Parse a hex integer at the address at the memory location pointed to
// by the memory location pointed to by 'c'. After returning the value
// at c is modified to point at the byte immediately following the last
// digit of the integer.
unsigned int gdbs_parse_hex_int(char **c) {
    unsigned int result = 0;
    while (1) {
        char digit = **c;
        int digit_val = 0;
        if (digit >= '0' && digit <= '9') {
            digit_val = digit - '0';
        }
        else if (digit >= 'a' && digit <= 'f') {
            digit_val = digit - 'a' + 10;
        }
        else {
            break;
        }
        result = (result << 4) | digit_val;
        (*c)++;
    }
    return result;
}

// Given a number between 0 and 15, returns a lowercase hex digit
// representing it. For values outside this range the result will
// be garbage.
inline static char gdbs_hex_digit(int val) {
    if (val < 10) {
        return '0' + val;
    }
    else {
        return 'a' + val - 10;
    }
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
    char *part = (char*)&packet; // Used to keep track of position during parsing

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

    case 'm': // read memory
        part++; // point at first digit of address
        int logaddr = gdbs_parse_hex_int(&part);
        // 'part' now points at the comma separating address from length
        part++; // point at first digit of length
        int length = gdbs_parse_hex_int(&part);

        // Will produce two hex characters for each byte we return,
        // plus null terminator.
        char *resp = malloc((length * 2) + 1);
        resp[length * 2] = '\0';

        char *digit = resp;
        for (int i = 0; i < length; i++) {
            unsigned int physaddr = mmu_map_addr(logaddr);
            mem_device *device = memory_device(physaddr);
            // N.B. Reading certain memory locations will trigger a
            // bus error in the emulated CPU, which is likely to have
            // unintended side-effects on program execution and
            // probably confuse GDB a bit.
            // FIXME: We should find some way to separate memory access
            // from CPU state so we can avoid causing side-effects when
            // reading memory in the debugger.
            unsigned int val = device ? device->read(physaddr) : 0xfe;
            *(digit++) = gdbs_hex_digit((val >> 4) & 0xf);
            *(digit++) = gdbs_hex_digit(val & 0xf);
            logaddr++;
        }

        result = gdbs_write_packet(csock, resp, 1);
        if (result < 0) {
            perror("Error writing to GDB socket");
            free(resp);
            return EXIT;
        }

        free(resp);

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
        // gdb considers an empty response to mean "unsupported command",
        // but if we send this then it seems to sometimes get itself stuck
        // in a loop waiting for a response, so we prefer to error instead
        // for now, at least until our set of supported commands is a little
        // more comprehensive.
        result = gdbs_write_packet(csock, "E01", 1);
        if (result < 0) {
            perror("Error writing to GDB socket");
            return EXIT;
        }
        break;
    }

    return new_mode;
}

int gdbs_handle_break(int csock) {
    int result = gdbs_write_packet(csock, "S05", 1);
    if (result < 0) {
        perror("Error writing break notification to GDB socket");
        return EXIT;
    }

    // After we tell GDB we're in break mode, enter READ
    // mode to process GDB command packets.
    return READ;
}
