#include "schedtimer.h"
#include <m68k.h>
#include <signal.h>
#include <stdio.h>
#include <string.h>
#include <sys/time.h>
#include <unistd.h>

// 200ms interval timer used as the timeslice signal
// for the OS to switch to another task.
// (200ms is a bit long, but our emulator is quite slow
// so we need to be sure to give it enough time to
// actually make some progress. Something like 80ms would
// be nicer.)
struct itimerval schedtimer_interval = {
    {0, 200},
    {0, 200},
};
struct itimerval schedtimer_disabled = {
    {0, 0},
    {0, 0},
};

void schedtimer_handler(int signum) {
    // TODO: Once it comes time to implement the interrupts from
    // other devices, we'll want to design and emulate an
    // interrupt controller. For now, we just directly signal
    // an interrupt.
    m68k_set_irq(1);
}

void schedtimer_init(void) {
    struct sigaction sa;

    memset(&sa, 0, sizeof(sa));
    sa.sa_handler = &schedtimer_handler;
    sigaction(SIGVTALRM, &sa, NULL);
}

void schedtimer_enable(void) {
    setitimer(ITIMER_VIRTUAL, &schedtimer_interval, NULL);
}

void schedtimer_disable(void) {
    setitimer(ITIMER_VIRTUAL, &schedtimer_disabled, NULL);
}
