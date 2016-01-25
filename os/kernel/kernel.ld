
MEMORY {
    kernel_ram : org = 0x000400, len = 4M
    kernel_rom : org = 0x400000, len = 4M
    boot_data_rom : org = 0xa00000, len = 2M
    vectors : org = 0x000000, len = 1k
}

REG_MMU_SELECTOR_0 = 0x900000;
REG_MMU_SELECTOR_1 = 0x900001;
REG_MMU_ROM_AT_ZERO = 0x900002;
REG_MMU_PAGE_TABLE = 0x900003;

/* Stack grows downwards, so we need to start at the top of it */
KERNEL_STACK_BOTTOM = 0x3fffff;

SECTIONS {
    . = 0;
    .text : {
        *(.text)
    } >kernel_rom
    .rodata : {
        *(.rodata)
    } >kernel_rom
    .data : {
        *(.initvectors)
        DATA_LOAD_START = LOADADDR(.data);
        DATA_VIRT_START = .;
        *(.data)
        DATA_VIRT_END = .;
    } >kernel_ram AT>boot_data_rom
    .bss : {
        BSS_VIRT_START = .;
        *(.bss)
        BSS_VIRT_END = .;
    } >kernel_ram AT>boot_data_rom
    .vectors : {
        DEFAULT_VECTORS_LOAD_START = LOADADDR(.vectors);
        DEFAULT_VECTORS_VIRT_START = .;
        *(.vectors)
        DEFAULT_VECTORS_VIRT_END = .;
    } >vectors AT>boot_data_rom
}
