#ifndef MAIN_H
#define MAIN_H

extern const void *vectors[256];

void main(void);
void kernel_bus_error(void);
void kernel_spurious_interrupt(void);
void kernel_privilege_violation(void);
void kernel_address_error(void);
void kernel_illegal_instruction(void);
void kernel_exception(void);
void kernel_timeslice(void);

#endif
