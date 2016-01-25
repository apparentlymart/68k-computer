#ifndef GFX_H
#define GFX_H

// FIXME: This doesn't work, for some reason.
extern unsigned short VIDEO_RAM_START;
//unsigned short *video_ram = &VIDEO_RAM_START;
unsigned short *video_ram = (unsigned short *)(0x00c00000);

#endif
