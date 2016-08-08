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

void on_each_instruction(void);
void loop(void);

#endif
