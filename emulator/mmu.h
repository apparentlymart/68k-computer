#ifndef MMU_H
#define MMU_H

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


#endif
