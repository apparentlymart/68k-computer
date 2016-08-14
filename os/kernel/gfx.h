#ifndef GFX_H
#define GFX_H

#include <stdint.h>

// FIXME: This doesn't work, for some reason.
extern unsigned short VIDEO_RAM_START;
//unsigned short *video_ram = &VIDEO_RAM_START;
unsigned short *video_ram = (unsigned short *)(0x00c00000);

static inline void gfx_putpixel(int x, int y, uint16_t clr) {
    video_ram[x + (y * 800)] = clr;
}

#endif
