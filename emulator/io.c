#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include "memory.h"
#include "io.h"

typedef struct {
    uint8_t tx;
    int tx_pending;
} uart_s;

uart_s uart = {0};

void io_init(void) {
    uart.tx = 0;
    uart.tx_pending = 0;
}

void io_update(void) {
    if (uart.tx_pending) {
        putchar(uart.tx);
        uart.tx = 0;
        uart.tx_pending = 0;
    }
}

uint8_t io_read(unsigned int addr) {
    unsigned int offset = addr - PHY_IO_BASE;
    switch (offset) {
      case 1:
          return uart.tx_pending ? 0 : 1;
      default:
          m68k_bus_error();
          return;
    }
}

void io_write(unsigned int addr, uint8_t val) {
    unsigned int offset = addr - PHY_IO_BASE;
    switch (offset) {
      case 0:
          if (! uart.tx_pending) {
              uart.tx = val;
              uart.tx_pending = 1;
          }
          return;

      case 255:
          // Emulator-only port to force an exit.
          puts("Kernel forced exit");
          fflush(stdout);
          exit(0);
          return;
      default:
          m68k_bus_error();
          return;
    }
}
