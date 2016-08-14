#include "gfx.h"
#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include <SDL.h>
#include <SDL_events.h>
#include <SDL_video.h>
#include <SDL_surface.h>
#include "memory.h"

uint16_t *gfx_ram_buf;
const uint32_t gfx_ram_size = 0x400000;
SDL_Window *win;
SDL_Texture *win_texture;
SDL_Renderer *win_renderer;
int update_pending = 1;
int quit_soon = 0;

#define DISPLAY_WIDTH 960
#define DISPLAY_HEIGHT 540

int gfx_init(void) {
    gfx_ram_buf = malloc(gfx_ram_size * sizeof(uint16_t));
    if (gfx_ram_buf == 0) {
        return -1;
    }

    if (SDL_Init(SDL_INIT_VIDEO) != 0) {
        return -1;
    }

    win = SDL_CreateWindow(
        "Emulator",
        SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
        DISPLAY_WIDTH, DISPLAY_HEIGHT,
        0
    );
    if (win == 0) {
        return -1;
    }

    win_renderer = SDL_CreateRenderer(win, -1, SDL_RENDERER_PRESENTVSYNC);
    if (win_renderer == 0) {
        return -1;
    }

    win_texture = SDL_CreateTexture(
        win_renderer,
        SDL_PIXELFORMAT_ARGB8888,
        SDL_TEXTUREACCESS_STREAMING,
        DISPLAY_WIDTH, DISPLAY_HEIGHT
    );
    if (win_texture == 0) {
        return -1;
    }

    return 0;
}

void gfx_update(void) {
    SDL_Event event;

    if (SDL_PollEvent(&event)) {
        switch (event.type) {
            case SDL_QUIT:
                quit_soon = 1;
                break;
        }
    }

    if (update_pending) {
        SDL_UpdateTexture(win_texture, NULL, gfx_ram_buf, DISPLAY_WIDTH * sizeof(uint32_t));
        SDL_RenderClear(win_renderer);
        SDL_RenderCopy(win_renderer, win_texture, NULL, NULL);
        SDL_RenderPresent(win_renderer);
        update_pending = 0;
    }
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
    unsigned int offset = addr - PHY_VRAM_BASE;
    uint16_t raw_val = gfx_ram_buf[offset];
    return (
        ((raw_val & 0x0f00) >> 4) |
        (raw_val & 0xf)
    );
}
void gfx_ram_write(unsigned int addr, uint8_t val) {
    unsigned int offset = addr - PHY_VRAM_BASE;
    uint16_t raw_val = (
        ((val & 0xf0) << 4) |
        ((val & 0xf) << 4)
    );
    update_pending = 1;
    gfx_ram_buf[offset] = raw_val;
}
