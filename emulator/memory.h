#ifndef MEMORY_H
#define MEMORY_H

#include <stdint.h>

#define PHY_BERR_BASE 0x0000000
#define PHY_BERR_MASK (0b11111111 << 20)
#define PHY_CTRL_BASE 0x0100000
#define PHY_CTRL_MASK (0b11111111 << 20)
#define PHY_PTBL_BASE 0x0200000
#define PHY_PTBL_MASK (0b11111111 << 20)
#define PHY_IO_BASE   0x0300000
#define PHY_IO_MASK   (0b11111111 << 20)
#define PHY_VRAM_BASE 0x3c00000
#define PHY_VRAM_MASK (0b11111100 << 20)
#define PHY_ROM_BASE  0x4000000
#define PHY_ROM_MASK  (0b11000000 << 20)
#define PHY_RAM_BASE  0x8000000
#define PHY_RAM_MASK  (0b10000000 << 20)
#define PHY_BROM_BASE 0x4400000
#define PHY_BROM_MASK (0b11111110 << 20)

extern int disasm;

typedef struct {
    uint8_t (*read)(unsigned int addr);
    void (*write)(unsigned int addr, uint8_t val);
    const char *name;
    unsigned int phy_base_addr;
} mem_device;

int memory_init(int rom_fd);
uint8_t read_memory_byte(unsigned int addr);
void write_memory_byte(unsigned int addr, uint8_t val);
mem_device *memory_device(unsigned int addr);
const char *memory_device_name(unsigned int addr);

#endif
