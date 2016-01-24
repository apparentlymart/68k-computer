#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>
#include <stdint.h>

uint8_t *rom;
uint8_t *ram;
const rom_size = 0x4000000;
const ram_size = 0x7F00000;

int memory_init(int rom_fd) {
    rom = mmap(NULL, rom_size, PROT_READ, MAP_SHARED, rom_fd, 0);
    if ((void*)rom == (void*)-1) {
        return -1;
    }

    ram = malloc(ram_size);
    if (ram == 0) {
        return -1;
    }
}

unsigned char read_memory_byte(unsigned int addr) {
    printf("Read from 0x%07x\n", addr);
    return 0;
}

void write_memory_byte(unsigned int addr, unsigned char val) {
    printf("Write %02x to 0x%07x\n", val, addr);
}
