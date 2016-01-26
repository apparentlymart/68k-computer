#include <m68k.h>
#include <stdio.h>
#include <stdint.h>
#include "addrutil.h"
#include "mmu.h"
#include "memory.h"

typedef struct {
    // If true, the first segment in the supervisor memory map is the
    // second segment of ROM. Otherwise, it's the first segment of RAM.
    int rom_at_zero;

    // Segment selectors for the two software-selectable memory segments.
    uint8_t selectors[2];
} supervisor_regs;

typedef struct {
    // Index of the currently-active user page table. Each user process
    // has its own page table, allowing it to have a different memory map.
    // Only the low nybble of this byte is significant.
    uint8_t active_page_table;
} user_regs;

supervisor_regs supervisor = { 1, {0, 0} };
user_regs user = { 0 };
int super_mode = 1;

// We support 16 active user page tables, each dividing the address space
// into 4096 pages of 4kB each. When in user mode, the active page table
// selector chooses the table and then the high 12 bits of the address
// choose the page table entry, yielding a new 16-bit prefix.
// The 16-bit prefix is then combined with the low 12 bits of the original
// logical address to produce a 28-bit physical address.
uint16_t page_table[16][4096];

unsigned int _mmu_map_addr_super(unsigned int logaddr) {
    if (ADDR_MATCH(logaddr, SUP_RAM_BASE, SUP_RAM_MASK)) {
        if (supervisor.rom_at_zero) {
            // Second segment of ROM
            return MAP_ADDR(logaddr, SUP_RAM_BASE, PHY_BROM_BASE);
        }
        else {
            // First segment of general RAM
            return MAP_ADDR(logaddr, SUP_RAM_BASE, PHY_RAM_BASE);
        }
    }

    if (ADDR_MATCH(logaddr, SUP_ROM_BASE, SUP_ROM_MASK)) {
        // First segment of ROM
        return MAP_ADDR(logaddr, SUP_ROM_BASE, PHY_ROM_BASE);
    }

    if (ADDR_MATCH(logaddr, SUP_IO_BASE, SUP_IO_MASK)) {
        // Primary I/O ports
        return MAP_ADDR(logaddr, SUP_IO_BASE, PHY_IO_BASE);
    }

    if (ADDR_MATCH(logaddr, SUP_CTRL_BASE, SUP_CTRL_MASK)) {
        // Board control registers
        return MAP_ADDR(logaddr, SUP_CTRL_BASE, PHY_CTRL_BASE);
    }

    if (ADDR_MATCH(logaddr, SUP_PTBL_BASE, SUP_PTBL_MASK)) {
        // Page table RAM
        return MAP_ADDR(logaddr, SUP_PTBL_BASE, PHY_PTBL_BASE);
    }

    if (ADDR_MATCH(logaddr, SUP_SEL0_BASE, SUP_SEL0_MASK)) {
        // Selectable Mapping 0
        return MAP_ADDR(logaddr, SUP_SEL0_BASE, supervisor.selectors[0] << 20);
    }

    if (ADDR_MATCH(logaddr, SUP_SEL1_BASE, SUP_SEL1_MASK)) {
        // Selectable Mapping 1
        return MAP_ADDR(logaddr, SUP_SEL1_BASE, supervisor.selectors[1] << 20);
    }

    if (ADDR_MATCH(logaddr, SUP_VRAM_BASE, SUP_VRAM_MASK)) {
        // Audio/video controller RAM
        return MAP_ADDR(logaddr, SUP_VRAM_BASE, PHY_VRAM_BASE);
    }

    // If we fall out here, map to the unmapped memory region that will
    // cause a bus error when accessed.
    return 0;
}

unsigned int _mmu_map_addr_user(unsigned int logaddr) {
    unsigned int page_num = logaddr >> 12;
    unsigned int offset = logaddr % 4096;
    return (page_table[user.active_page_table][page_num] << 12) | offset;
}

uint8_t mmu_ctrl_read(unsigned int addr) {
    unsigned int offset = addr - 0x0100000;
    switch (offset) {
      case 0:
      case 1:
          return supervisor.selectors[offset];
      case 2:
          return supervisor.rom_at_zero ? 0x1 : 0x0;
      case 3:
          return user.active_page_table;
      default:
          m68k_bus_error();
          return 0;
    }
    return 0;
}

void mmu_ctrl_write(unsigned int addr, uint8_t val) {
    unsigned int offset = addr - 0x0100000;
    switch (offset) {
      case 0:
      case 1:
          printf("-- SELECTABLE MAPPING %i NOW 0x%02x00000\n", offset, val);
          supervisor.selectors[offset] = val;
          return;
      case 2:
          if (val) {
              puts("-- INIT ROM SELECTED AT 0x000000");
          }
          else {
              puts("-- KERNEL RAM SELECTED AT 0x000000");
          }
          supervisor.rom_at_zero = val ? 0x1 : 0x0;
          return;
      case 3:
          printf("-- ACTIVE PAGE TABLE NOW 0x%02x\n", val);
          user.active_page_table = val;
          return;
      default:
          m68k_bus_error();
          return;
    }
}

// CPU emulator calls this each time the CPU function code changes.
// This happens when we switch to and from supervisor mode.
void m68k_set_fc(unsigned int fc) {
    super_mode = (fc == 0b101 || fc == 0b110);
}
