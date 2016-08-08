#include <sys/socket.h>
#include <arpa/inet.h>
#include <string.h>
#include "gdbserver.h"

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
