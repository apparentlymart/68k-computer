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

#endif
