#include "io.h"
#include "main.h"

// Main kernel entry point.
// By the time we get here, the global variables have been initialized,
// a basic, largly-invalid exception vector table is installed, and
// the stack is configured properly.
// (The low level initialization happens before we get here, in init.s and
// boot.c .)
void main(void) {
    io_uart_print("Kernel booting...\n");
    while (1) {}
}
