#include "addrutil.h"
#include "mmu.h"
#include <stdint.h>

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

unsigned int mmu_map_addr(unsigned int logaddr) {
    // For the moment this only supports supervisor mode.

    if (MATCH_ADDR(0b00, logaddr, 22)) {
        if (supervisor.rom_at_zero) {
            // Second segment of ROM
            return MAP_ADDR(0b010001, logaddr, 22);
        }
        else {
            // First segment of general RAM
            return MAP_ADDR(0b100000, logaddr, 22);
        }
    }

    if (MATCH_ADDR(0b01, logaddr, 22)) {
        // First segment of ROM
        return MAP_ADDR(0b010000, logaddr, 22);
    }

    if (MATCH_ADDR(0b1000, logaddr, 20)) {
        // Primary I/O ports
        return MAP_ADDR(0b00000011, logaddr, 20);
    }

    if (MATCH_ADDR(0b10010, logaddr, 19)) {
        // Board control registers
        return MAP_ADDR(0b000000010, logaddr, 19);
    }

    if (MATCH_ADDR(0b10011, logaddr, 19)) {
        // Page table RAM
        return MAP_ADDR(0b000000100, logaddr, 19);
    }

    if (MATCH_ADDR(0b1010, logaddr, 20)) {
        // Selectable Mapping 1
        // Not yet selectable, so just always return the unmapped memory section
        return MAP_ADDR(supervisor.selectors[0], logaddr, 20);
    }

    if (MATCH_ADDR(0b1011, logaddr, 20)) {
        // Selectable Mapping 2
        // Not yet selectable, so just always return the unmapped memory section
        return MAP_ADDR(supervisor.selectors[1], logaddr, 20);
    }

    if (MATCH_ADDR(0b11, logaddr, 22)) {
        // Audio/video controller RAM
        return MAP_ADDR(0b001111, logaddr, 22);
    }

    // If we fall out here, map to the unmapped memory region that will
    // cause a bus error when accessed.
    return 0;
}
