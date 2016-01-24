#include <m68k.h>
#include <stdio.h>
#include "mmu.h"
#include "emulator.h"

int main(int argc, char **argv) {
    m68k_init();
    m68k_set_cpu_type(M68K_CPU_TYPE_68000);
    m68k_pulse_reset();

    m68k_execute(1000);

    return 0;
}

unsigned char read_memory_byte(unsigned int addr) {
    printf("Read from 0x%07x\n", addr);
    return 0;
}

void write_memory_byte(unsigned int addr, unsigned char val) {
    printf("Write %02x to 0x%07x\n", val, addr);
}

unsigned int m68k_read_memory_8(unsigned int logaddr) {
    unsigned int physaddr = mmu_map_addr(logaddr);
    return read_memory_byte(physaddr);
}

unsigned int m68k_read_memory_16(unsigned int logaddr) {
    unsigned int physaddr = mmu_map_addr(logaddr);
    return (read_memory_byte(physaddr)<<8) | (read_memory_byte(physaddr + 1));
}

unsigned int m68k_read_memory_32(unsigned int logaddr) {
    unsigned int physaddr = mmu_map_addr(logaddr);
    return (
        (read_memory_byte(physaddr)<<24) |
        (read_memory_byte(physaddr + 1)<<16) |
        (read_memory_byte(physaddr + 2)<<8) |
        (read_memory_byte(physaddr + 3))
    );

    // This old stuff can be removed once I'm done referring to it.
    printf("Read 32 bits at 0x%06x => 0x%07x\n", logaddr, physaddr);
    if (logaddr == 0x4) {
        // TEMP: Fake the initial PC vector for now, until we have
        // enough of this implemented to have the ROM here on startup.
        // This is the address of the permanent beginning of ROM in
        // supervisor mode.
        return 0x400008;

        // The intended boot sequence is as follows:
        // - on reset, kernel rom is mapped at *both* 0x000000 and 0x400000
        // - CPU reads the initial PC vector from addr 0x4, which maps to ROM
        // - ROM has 0x400008 at this offset, so execution begins in the second
        //   ROM mapping, after the static init vectors.
        // - The kernel code's first act is to write to a board control register
        //   to turn off the shadow ROM at 0x000000 so that the RAM is visible
        //   in its place.
        // - The kernel can then set up its vector table, stack, heap and static
        //   data segments inside its reserved 4MB space at the top of physical
        //   RAM, and then jump into its "real" entry point.
    }
    return 0;
}

void m68k_write_memory_8(unsigned int logaddr, unsigned int val) {
    unsigned int physaddr = mmu_map_addr(logaddr);
    write_memory_byte(physaddr, (unsigned char)val);
}

void m68k_write_memory_16(unsigned int logaddr, unsigned int val) {
    unsigned int physaddr = mmu_map_addr(logaddr);
    write_memory_byte(physaddr, (unsigned char)(val>>8));
    write_memory_byte(physaddr + 1, (unsigned char)val);
}

void m68k_write_memory_32(unsigned int logaddr, unsigned int val) {
    unsigned int physaddr = mmu_map_addr(logaddr);
    write_memory_byte(physaddr, (unsigned char)(val>>24));
    write_memory_byte(physaddr + 1, (unsigned char)(val>>16));
    write_memory_byte(physaddr + 2, (unsigned char)(val>>8));
    write_memory_byte(physaddr + 3, (unsigned char)val);
}

unsigned int m68k_read_disassembler_8(unsigned int logaddr) {
    return m68k_read_memory_8(logaddr);
}

unsigned int m68k_read_disassembler_16(unsigned int logaddr) {
    return m68k_read_memory_16(logaddr);
}

unsigned int m68k_read_disassembler_32(unsigned int logaddr) {
    return m68k_read_memory_32(logaddr);
}