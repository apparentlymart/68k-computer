#ifndef GFX_H
#define GFX_H

#include <stdint.h>

extern int quit_soon;

int gfx_init(void);
void gfx_update(void);
uint8_t gfx_ram_read(unsigned int addr);
void gfx_ram_write(unsigned int addr, uint8_t val);

#endif
