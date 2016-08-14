#ifndef KERNEL_H
#define KERNEL_H

#include <stdint.h>

typedef struct {
    uint32_t d[8];
    uintptr_t a[8];
    uintptr_t pc;
    uint16_t sr;
} task_state;

void kernel_save_task_state(task_state *state);

// Begin running code with the given status bits.
//
// Usually used to return control to user mode, in which case the supervisor
// bit will be unset in the status word and the given address is a logical
// address within the *user* memory space.
// Before executing this function the MMU must be appropriately configured
// to make the desired code apprar at the given address.
// This function does not return. If calling into user mode, control returns
// to the kernel only via exception handling.
static inline void kernel_run_code(uintptr_t addr, uint16_t status) {
    // We run user code by exploiting the "rte" instruction's ability
    // to set the status word and update the program counter within a
    // single instruction.
    uint16_t pc_hi = (uint16_t)(addr >> 16);
    uint16_t pc_lo = (uint16_t)(addr);
    asm(
        "mov.w %0, %%sp@-\n\t"
        "mov.w %1, %%sp@-\n\t"
        "mov.w %2, %%sp@-\n\t"
        "rte"
        :
        : "r"(pc_lo), "r"(pc_hi), "r"(status)
    );
}

#define kernel_make_cpu_status(trace, super, interrupt_level, x, n, z, v, c) \
    ( \
        (trace) << 15 | \
        (super) << 13 | \
        (interrupt_level) << 8 | \
        (x) << 4 | \
        (n) << 3 | \
        (z) << 2 | \
        (v) << 1 | \
        (c) << 0 \
    )

#define kernel_cpu_stop(status) asm volatile ("stop %0" : : "n" (status))

#define kernel_cpu_set_status(status) asm volatile ("move %0, %%sr" : : "rn" (status))

#endif
