    .global exc_default
    .global exc_bus_error
    .global exc_address_error
    .global exc_illegal_instruction
    .global exc_divide_by_zero
    .global exc_chk
    .global exc_trapv
    .global exc_privilege_violation
    .global exc_timeslice
    .global exc_inner

    .macro exc_handler vector=0
    move.w \vector, %sp@- /* Push exception vector */

    /* Now the inner exception handler sees the following on the stack for
       group 1 and 2 exceptions (everything except Bus and Address errors):
        +0 exception vector            (lowest address)
        +1 status register
        +2 program counter high word
        +3 program counter low word    (highest address)

       The inner handler must pop off the exception vector before
       executing rte.

       Bus and Address errors have a more elaborate stack frame:
       +0 exception vector
       +1 r/w, i/n, function code (see 68000 programmers manual)
       +2 access address high word
       +3 access address low word
       +4 instruction register
       +5 status register
       +6 program counter high word
       +7 program counter low word

       In this case the inner handler must pop off everything except
       the bottom three words before executing rte.
    */
    bra exc_inner
    .endm

exc_default:
    exc_handler #0

exc_bus_error:
    exc_handler #2

exc_address_error:
    exc_handler #3

exc_illegal_instruction:
    exc_handler #4

exc_divide_by_zero:
    exc_handler #5

exc_chk:
    exc_handler #6

exc_trapv:
    exc_handler #7

exc_privilege_violation:
    exc_handler #8

exc_timeslice:
    exc_handler #64

exc_inner:
    /* save general purpose registers */
    movem.l %d0-%d7/%a0-%a7,%sp@-

    /* unhandled_exception(vector) */
    move.l %sp@(+64), %sp@-
    bsr unhandled_exception

    /* restore general purpose registers */
    movem.l %sp@+,%d0-%d7/%a0-%a7

    /* Pop off the vector we added in the exc_handler macro */
    subq.l #4, %sp

    /* TODO: Also deal with the extra stuff in the bus error
      and address error stack frames. (see comment above) */
    rte
