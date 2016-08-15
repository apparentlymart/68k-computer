#ifndef INTERRUPTS_H
#define INTERRUPTS_H

// Default exception handler, for exceptions that don't have an explicit
// handler.
void exc_default(void);

void exc_bus_error(void);
void exc_address_error(void);
void exc_illegal_instruction(void);
void exc_divide_by_zero(void);
void exc_chk(void);
void exc_trapv(void);
void exc_privilege_violation(void);

// User Interrupt 1, which is triggered by our timeslice clock
void exc_timeslice(void);

#endif
