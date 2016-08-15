#include "kernel.h"
#include "io.h"
#include "gfx.h"
#include "main.h"
#include "list.h"
#include "scheduler.h"
#include <stdint.h>

volatile uintptr_t user_mode_addr = 0x00000000;
volatile uint16_t user_mode_status = 0b0000000000000000;

// Main kernel entry point.
// By the time we get here, the global variables have been initialized,
// a basic, largly-invalid exception vector table is installed, and
// the stack is configured properly.
// (The low level initialization happens before we get here, in init.s and
// boot.c .)
void main(void) {
    io_uart_print("Kernel booting...\n");

    // Some more helpful handlers for exceptions
    for (int i = 0; i < 255; i++) {
        vectors[i] = &kernel_exception;
    }
    vectors[2] = &kernel_bus_error;
    vectors[3] = &kernel_address_error;
    vectors[4] = &kernel_illegal_instruction;
    vectors[8] = &kernel_privilege_violation;
    vectors[24] = &kernel_spurious_interrupt;

    // Timeslice vector
    vectors[64] = &kernel_timeslice;

    for (int y = 0; y < GFX_HEIGHT; y++) {
        for (int x = 0; x < GFX_WIDTH; x++) {
            gfx_putpixel(x, y, 0xf000 | (((y >> 2) & 0xf) << 8) | ((x >> 2) & 0xf));
        }
    }

    io_uart_print("Done updating screen\n");

    //IO_QUIT_EMU = 1;
    // Try to switch into user mode.
    // This will produce a bus error exception because we don't have anthing
    // mapped into the user memory space.
    //kernel_run_code(user_mode_addr, user_mode_status);
    //asm("stop #2700");
    while (1) {
        // Stop with interrupts enabled
        kernel_cpu_stop(kernel_make_cpu_status(0, 1, 0, 0, 0, 0, 0, 0));
        io_uart_print(".");
    }
}

__attribute__((interrupt)) void kernel_timeslice(void) {
    // Nothing to do here yet. Once we actually have a scheduler and
    // are running user processes this will be one place where that
    // scheduler gets triggered, but for now we're just spinning
    // around the loop main() above, waiting for interrupts to be
    // triggered.
}

void kernel_bus_error(void) {
    io_uart_print("\n\nBUS ERROR\nSystem halted\n");
    IO_QUIT_EMU = 1;
    asm("stop #2700");
}

void kernel_address_error(void) {
    io_uart_print("\n\nADDRESS ERROR\nSystem halted\n");
    IO_QUIT_EMU = 1;
    asm("stop #2700");
}

void kernel_illegal_instruction(void) {
    io_uart_print("\n\nILLEGAL INSTRUCTION ERROR\nSystem halted\n");
    IO_QUIT_EMU = 1;
    asm("stop #2700");
}

void kernel_privilege_violation(void) {
    io_uart_print("\n\nPRIVILEGE VIOLATION ERROR\nSystem halted\n");
    IO_QUIT_EMU = 1;
    asm("stop #2700");
}

void kernel_spurious_interrupt(void) {
    io_uart_print("\n\nSPURIOUS INTERRUPT\nSystem halted\n");
    IO_QUIT_EMU = 1;
    asm("stop #2700");
}

void kernel_exception(void) {
    io_uart_print("\n\nERRANT EXCEPTION\nSystem halted\n");
    IO_QUIT_EMU = 1;
    asm("stop #2700");
}
