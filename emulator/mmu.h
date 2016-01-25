#ifndef MMU_H
#define MMU_H

#include <stdint.h>

#define SUP_RAM_BASE  0x000000
#define SUP_RAM_MASK  (0b11000000 << 16)
#define SUP_ROM_BASE  0x400000
#define SUP_ROM_MASK  (0b11000000 << 16)
#define SUP_IO_BASE   0x800000
#define SUP_IO_MASK   (0b11110000 << 16)
#define SUP_CTRL_BASE 0x900000
#define SUP_CTRL_MASK (0b11111000 << 16)
#define SUP_PTBL_BASE 0x980000
#define SUP_PTBL_MASK (0b11111000 << 16)
#define SUP_SEL0_BASE 0xa00000
#define SUP_SEL0_MASK (0b11110000 << 16)
#define SUP_SEL1_BASE 0xa00000
#define SUP_SEL1_MASK (0b11110000 << 16)
#define SUP_VRAM_BASE 0xc00000
#define SUP_VRAM_MASK (0b11000000 << 16)

// Given a logical address, return the corresponding physical address.
//
// The logical address is the 24-bit address presented by the CPU, representing
// an address in the 16MB virtual address space.
// The physical address is a 28-bit address that maps into the 256MB physical
// address space.
//
// The MMU uses a fixed memory map for supervisor mode and a page table
// structure for user mode. These mode selections are not yet implemented,
// so this function currently supports just a subset of supervisor mode.
//
unsigned int mmu_map_addr(unsigned int logaddr);

uint8_t mmu_ctrl_read(unsigned int addr);
uint8_t mmu_ctrl_write(unsigned int addr, uint8_t val);

#endif
