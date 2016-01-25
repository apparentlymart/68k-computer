#ifndef IO_H
#define IO_H

#include "memory.h"

void io_init(void);

// Main loop should call this periodically to update the I/O device
// emulation state, fire interrupts, etc.
void io_update(void);

// Memory device implementation
uint8_t io_read(unsigned int addr);
void io_write(unsigned int addr, uint8_t val);

#endif
