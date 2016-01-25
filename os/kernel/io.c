#include "io.h"

void io_uart_print(const char *data) {
    char ch = *data;
    while (1) {
        char ch = *data;
        if (ch == 0) {
            return;
        }
        // Spin until the UART becomes ready.
        while (!IO_UART_TX_READY) {}
        IO_UART_TX = ch;
        data++;
    }
}
