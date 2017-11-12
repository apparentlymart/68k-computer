#include "schedtimer.h"
#include <m68k.h>
#include <signal.h>
#include <stdio.h>
#include <string.h>
#include <sys/time.h>
#include <unistd.h>

void schedtimer_init(void) {
}

void schedtimer_update(int prev_cycles, int new_cycles) {
    if (0) {
        // TODO: Once it comes time to implement the interrupts from
        // other devices, we'll want to design and emulate an
        // interrupt controller. For now, we just directly signal
        // an interrupt.
        m68k_set_irq(1);
    }
}
