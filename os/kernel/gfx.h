#ifndef GFX_H
#define GFX_H

#include <stdint.h>

#define VIDEO_RAM ((unsigned short *)(0x00c00000))
#define GFX_WIDTH 960
#define GFX_HEIGHT 540

static inline void gfx_putpixel(int x, int y, uint16_t clr) {
    VIDEO_RAM[x + (y * GFX_WIDTH)] = clr;
}

#endif
