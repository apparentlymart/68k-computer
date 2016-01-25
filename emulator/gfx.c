#include "gfx.h"
#include <stdlib.h>
#include <stdint.h>
#include "memory.h"

uint16_t *gfx_ram_buf;
const gfx_ram_size = 0x400000;

int gfx_init(void) {
    gfx_ram_buf = malloc(gfx_ram_size * sizeof(uint16_t));
    if (gfx_ram_buf == 0) {
        return -1;
    }

    return 0;
}

uint8_t gfx_ram_read(unsigned int addr) {
    // The graphics RAM is stored in an unusual way.
    // Video memory is a 16-bit-per-pixel buffer with 4 bits per channel.
    // We store it internally in an expanded form where the 4 channel bits
    // are shifted up 4 bits to create an 8-bits-per-channel, 32-bit-per-pixel
    // bitmap, which can then be easily blitted into the video buffer that
    // serves as our emulated display.
    // The rationale here is that we'll render the screen more often than
    // we'll access video memory, so it's worth doing a bit of extra work
    // on read/write to get more efficient screen refreshes.
    unsigned int offset = addr - PHY_RAM_BASE;
    uint16_t raw_val = gfx_ram_buf[offset];
    return (
        ((raw_val & 0x0f00) >> 4) |
        (raw_val & 0xf)
    );
}
uint8_t gfx_ram_write(unsigned int addr, uint8_t val) {
    unsigned int offset = addr - PHY_RAM_BASE;
    uint16_t raw_val = (
        ((val & 0xf0) << 4) |
        (val & 0xf)
    );
    gfx_ram_buf[offset] = raw_val;
}
