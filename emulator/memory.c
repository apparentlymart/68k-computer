#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>
#include <stdint.h>
#include <m68k.h>
#include "addrutil.h"
#include "gfx.h"
#include "mmu.h"
#include "memory.h"
#include "io.h"

typedef struct {
    uint8_t (*read)(unsigned int addr);
    void (*write)(unsigned int addr, uint8_t val);
    const char *name;
    unsigned int phy_base_addr;
} mem_device;

uint8_t *rom_buf;
uint8_t *ram_buf;
const rom_size = 0x4000000;
const ram_size = 0x7F00000;

// Set this to 1 whenever working with the diassembler so that we
// can suppress memory access traces that aren't coming from the
// emulated CPU itself.
int disasm = 0;

void invalid_write(unsigned int addr, uint8_t val) {
    m68k_bus_error();
}

uint8_t rom_read(unsigned int addr) {
    int offset = addr - PHY_ROM_BASE;
    return rom_buf[offset];
}
mem_device rom = {
    rom_read,
    invalid_write,
    "ROM",
    PHY_ROM_BASE
};

uint8_t ram_read(unsigned int addr) {
    unsigned int offset = addr - PHY_RAM_BASE;
    return ram_buf[offset];
}
void ram_write(unsigned int addr, uint8_t val) {
    unsigned int offset = addr - PHY_RAM_BASE;
    ram_buf[offset] = val;
}
mem_device ram = {
    ram_read,
    ram_write,
    "RAM",
    PHY_RAM_BASE
};

mem_device gfx_ram = {
    gfx_ram_read,
    gfx_ram_write,
    "VRAM",
    PHY_VRAM_BASE
};

mem_device mmu_ctrl = {
    mmu_ctrl_read,
    mmu_ctrl_write,
    "CTRL",
    PHY_CTRL_BASE
};

mem_device io = {
    io_read,
    io_write,
    "IO",
    PHY_IO_BASE
};

int memory_init(int rom_fd) {
    rom_buf = mmap(NULL, rom_size, PROT_READ, MAP_SHARED, rom_fd, 0);
    if ((void*)rom_buf == (void*)-1) {
        return -1;
    }

    ram_buf = malloc(ram_size);
    if (ram_buf == 0) {
        return -1;
    }

    return 0;
}

mem_device *memory_device(unsigned int addr) {
    if (ADDR_MATCH(addr, PHY_CTRL_BASE, PHY_CTRL_MASK)) {
        return &mmu_ctrl;
    }
    else if (ADDR_MATCH(addr, PHY_PTBL_BASE, PHY_PTBL_MASK)) {
        // TODO: Return user mode page table
        return 0;
    }
    else if (ADDR_MATCH(addr, PHY_IO_BASE, PHY_IO_MASK)) {
        return &io;
    }
    else if (ADDR_MATCH(addr, PHY_VRAM_BASE, PHY_VRAM_MASK)) {
        return &gfx_ram;
    }
    else if (ADDR_MATCH(addr, PHY_ROM_BASE, PHY_ROM_MASK)) {
        return &rom;
    }
    else if (ADDR_MATCH(addr, PHY_RAM_BASE, PHY_RAM_MASK)) {
        return &ram;
    }
    else {
        // Unmapped memory, which should cause a bus error.
        return 0;
    }
}

uint8_t read_memory_byte(unsigned int addr) {
    mem_device *device = memory_device(addr);
    if (device == 0) {
        if (! disasm) {
            //printf("\t\e[1;31mBERR 0x%07x -> 0x..\e[0m\n", addr);
        }
        m68k_bus_error();
        return 0;
    }
    if (! disasm) {
        //printf("\t%4s 0x%07x -> ", device->name, addr);
    }
    fflush(stdout);
    uint8_t val = device->read(addr);
    if (! disasm) {
        //printf("0x%02x\n", (int)val);
    }
    return val;
}

void write_memory_byte(unsigned int addr, uint8_t val) {
    mem_device *device = memory_device(addr);
    if (device == 0) {
        if (! disasm) {
            //printf("\t\e[1;31mBERR 0x%07x <- 0x%02x\e[0m\n", addr, val);
        }
        m68k_bus_error();
        return;
    }
    if (! disasm) {
        //printf("\t%4s 0x%07x <- 0x%02x\n", device->name, addr, val);
    }
    device->write(addr, val);
}
