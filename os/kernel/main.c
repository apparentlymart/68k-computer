#include "io.h"
#include "gfx.h"
#include "main.h"

// Main kernel entry point.
// By the time we get here, the global variables have been initialized,
// a basic, largly-invalid exception vector table is installed, and
// the stack is configured properly.
// (The low level initialization happens before we get here, in init.s and
// boot.c .)
void main(void) {
    io_uart_print("Kernel booting...\n");

    // Install a more helpful handler for bus errors
    vectors[2] = &kernel_bus_error;

    for (int y = 0; y < 600; y++) {
        for (int x = 0; x < 800; x++) {
            unsigned short *loc = (unsigned short *)0xc00000 + x + (y * 800);
            *loc = 0xf000 | (((y >> 2) & 0xf) << 8) | ((x >> 2) & 0xf);
        }
    }

    io_uart_print("Done updating screen\n");
    //IO_QUIT_EMU = 1;
    while (1) {}
}

void kernel_bus_error(void) {
    //io_uart_print("\n\nBUS ERROR\nSystem halted\n");
    IO_QUIT_EMU = 1;
    while (1) {}
}

