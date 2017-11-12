#include "kernel.h"
#include "io.h"
#include "gfx.h"
#include "main.h"
#include "list.h"
#include "scheduler.h"
#include "exceptions.h"
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
        vectors[i] = &exc_default;
    }
    vectors[2] = &exc_bus_error;
    vectors[3] = &exc_address_error;
    vectors[4] = &exc_illegal_instruction;
    vectors[8] = &exc_privilege_violation;

    // Timeslice vector
    vectors[64] = &exc_timeslice;

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
    /*while (1) {
        // Stop with interrupts enabled
        kernel_cpu_stop(kernel_make_cpu_status(0, 1, 0, 0, 0, 0, 0, 0));
        io_uart_print(".");
        }*/

    // Schedulers gonna schedule
    sched_schedule();
}

void unhandled_exception(int vector) {
    io_uart_print("\n\nUNHANDLED EXCEPTION\nSystem halted\n");
    IO_QUIT_EMU = 1;
    asm("stop #2700");
}
