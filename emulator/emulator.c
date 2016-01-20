#include <m68k.h>
#include <stdio.h>
#include "emulator.h"

int main(int argc, char **argv) {
    m68k_init();
    m68k_set_cpu_type(M68K_CPU_TYPE_68000);
    m68k_pulse_reset();

    m68k_execute(100);

    return 0;
}

unsigned int m68k_read_memory_8(unsigned int addr) {
    printf("Read 8 bits at 0x%08x\n", addr);
    return 0;
}

unsigned int m68k_read_memory_16(unsigned int addr) {
    printf("Read 16 bits at 0x%08x\n", addr);
    return 0;
}

unsigned int m68k_read_memory_32(unsigned int addr) {
    printf("Read 32 bits at 0x%08x\n", addr);
    return 0;
}

void m68k_write_memory_8(unsigned int addr, unsigned int val) {
}

void m68k_write_memory_16(unsigned int addr, unsigned int val) {
}

void m68k_write_memory_32(unsigned int addr, unsigned int val) {
}

unsigned int m68k_read_disassembler_8(unsigned int addr) {
    return 0;
}

unsigned int m68k_read_disassembler_16(unsigned int addr) {
    return 0;
}

unsigned int m68k_read_disassembler_32(unsigned int addr) {
    return 0;
}
