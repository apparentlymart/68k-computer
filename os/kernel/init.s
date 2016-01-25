
    .global init
    .global boot
    .global REG_MMU_ROM_AT_ZERO
    .global REG_MMU_SELECTOR_0
    .global REG_MMU_SELECTOR_1

    .text
init:
    /* Unmap the ROM in the first memory segment, revealing the Kernel RAM */
    clr.b REG_MMU_ROM_AT_ZERO
    jmp boot
