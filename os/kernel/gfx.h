#ifndef GFX_H
#define GFX_H

#include <stdint.h>

#define VIDEO_RAM ((unsigned short *)(0x00c00000))

static inline void gfx_putpixel(int x, int y, uint16_t clr) {
    VIDEO_RAM[x + (y * 800)] = clr;
}

#endif
