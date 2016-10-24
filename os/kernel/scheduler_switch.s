
    .global sched_save_current
    .global sched_schedule
    .global sched_task_running
    .text

sched_save_standard_frame:
    /* Call this from the very beginning of a handler for a "standard"
       exception (Group 1 or 2... not Bus or Address Error, basically)

       A standard exception frame is the four-byte program counter followed
       by the 16-byte status register.
    */

    /* Push A0 onto the stack so we have a register to work with. */
    move.l %a0, %sp@-

    /* Find the current task */
    move.l sched_task_running, %a0

    /* If there is no current task (we were interrupted inside the kernel)
       then */

    /* Push all the registers onto the stack to start. Then we
       can actually use some registers to do work in here. */
    /*movem.l %d0-%d7/%a0-%a7, %sp@-*/

    /* %a7 must actually be the user stack pointer */
    move.l %usp, %a0
    move.l %a0, %sp@(4*15)

    rts

sched_schedule:
    /* No register preservation is done here because we never return,
      and thus any caller state is forfeit. */

    /* Reset the supervisor stack pointer to its initial value, thus
       brutally discarding any stack frames that might exist without
       doing any sort of cleanup. We never resume after scheduling. */
    move.l #0, %a0              /* Address of the Initial SP vector to A0 */
    move.l (%a0), %sp           /* Value of Initial SP vector to SP */

    /* For now we don't actually do any sort of scheduling, so we just
      stop the CPU until another interrupt fires. */
    stop #0x2000
