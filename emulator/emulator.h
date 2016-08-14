#ifndef EMULATOR_H
#define EMULATOR_H

typedef enum {
    LISTEN,
    READ,
    RUN,
    STEP,
    BREAK,
    EXIT
} Mode;

int on_each_instruction(void);
int on_interrupt(int level);
void loop(void);

#endif
