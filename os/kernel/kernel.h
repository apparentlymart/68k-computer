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

#endif
