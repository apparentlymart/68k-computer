#ifndef MEMORY_H
#define MEMORY_H

int memory_init(int rom_fd);
unsigned char read_memory_byte(unsigned int addr);
void write_memory_byte(unsigned int addr, unsigned char val);

#endif
