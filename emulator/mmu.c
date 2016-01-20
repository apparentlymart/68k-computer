#include "addrutil.h"
#include "mmu.h"

unsigned int mmu_map_addr(unsigned int logaddr) {
    // For the moment this only supports supervisor mode and it
    // has hard-coded selections for the two selectable memory segments.

    if (MATCH_ADDR(0b00, logaddr, 22)) {
        // First part of general RAM
        return MAP_ADDR(0b100000, logaddr, 22);
    }

    if (MATCH_ADDR(0b01, logaddr, 22)) {
        // First part of ROM
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
        return MAP_ADDR(0b00000000, logaddr, 20);
    }

    if (MATCH_ADDR(0b1011, logaddr, 20)) {
        // Selectable Mapping 2
        // Not yet selectable, so just always return the unmapped memory section
        return MAP_ADDR(0b00000000, logaddr, 20);
    }

    if (MATCH_ADDR(0b11, logaddr, 22)) {
        // Audio/video controller RAM
        return MAP_ADDR(0b001111, logaddr, 22);
    }

    // If we fall out here, map to the unmapped memory region that will
    // cause a bus error when accessed.
    return 0;
}
