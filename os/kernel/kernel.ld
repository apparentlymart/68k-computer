
MEMORY {
    virt_kernel_rom  : org = 0x00400000, len = 8M
    virt_kernel_ram  : org = 0x00000400, len = 7M
    virt_kernel_stack : org = 0x00400000 - 1M, len = 1M
    virt_boot_data_rom : org = 0x00a00000, len = 4M
    virt_boot_vectors : org = 0x00000000, len = 8
    virt_runtime_vectors : org = 0x00000000, len = 1024

    phys_kernel_rom : org = 0x00000000, len = 8M
    phys_boot_data_rom : org = 0x00000000 + 8M, len = 4M
}

REG_MMU_SELECTOR_0 = 0x800000;
REG_MMU_SELECTOR_1 = 0x800001;
REG_MMU_ROM_AT_ZERO = 0x800002;

/* Stack grows downwards, so we need to start at the top of it */
KERNEL_STACK_BOTTOM = ORIGIN(kernel_stack) + LENGTH(kernel_stack) - 1;

SECTIONS {
    . = 0;
    .initvectors : {
        *(.initvectors)
    } >virt_boot_vectors AT>virt_boot_data_rom
    .data : {
        DATA_LOAD_START = LOADADDR(.data);
        DATA_VIRT_START = .;
        *(.data)
        DATA_VIRT_END = .;
    } >virt_kernel_ram AT>virt_boot_data_rom
    .vectors : {
        DEFAULT_VECTORS_LOAD_START = LOADADDR(.vectors);
        DEFAULT_VECTORS_VIRT_START = .;
        *(.vectors)
        DEFAULT_VECTORS_VIRT_END = .;
    } >virt_runtime_vectors AT>virt_boot_data_rom
    BSS_VIRT_START = .;
    .bss : {
        *(.bss)
    } >virt_kernel_ram
    BSS_VIRT_END = .;

    .rodata : {
        *(.rodata)
    } >virt_kernel_rom AT>virt_kernel_rom
    .text : {
        *(.text)
    } >virt_kernel_rom AT>virt_kernel_rom
}
