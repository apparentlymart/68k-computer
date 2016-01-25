
////// These are linker symbols, configured by the linker script kernel.ld
// Start position of the kernel stack (top of the main kernel RAM)
extern unsigned char KERNEL_STACK_BOTTOM;
// Load and virtual positions of initial global data
extern unsigned char DATA_LOAD_START;
extern unsigned char DATA_VIRT_START;
extern unsigned char DATA_VIRT_END;
// Uninitialized global data
extern unsigned char BSS_VIRT_START;
extern unsigned char BSS_VIRT_END;
// Default vector table
extern unsigned char DEFAULT_VECTORS_LOAD_START;
extern unsigned char DEFAULT_VECTORS_VIRT_START;
extern unsigned char DEFAULT_VECTORS_VIRT_END;
// MMU control registers used during boot
extern unsigned char REG_MMU_ROM_AT_ZERO;
extern unsigned char REG_MMU_SELECTOR_0;
extern unsigned char REG_MMU_SELECTOR_1;

extern unsigned char init;

// This function contains the first code that runs after the CPU comes out
// of reset.
void boot(void) {
    // Select into the two selectable mapping segments the area of
    // memory containing the initial global data and initial vector table.
    // (DATA_LOAD_START and DEFAULT_VECTORS_LOAD_START point into the
    // selectable mapping segments, so this must be done before
    // deferencing those pointers.)
    REG_MMU_SELECTOR_0 = 0b01000100;
    REG_MMU_SELECTOR_1 = 0b01000101;

    unsigned char *src;
    unsigned char *dest;
    unsigned len;

    // Copy pre-initialized global data
    src = &DATA_LOAD_START;
    dest = &DATA_VIRT_START;
    for (len = &DATA_VIRT_END - &DATA_VIRT_START; len > 0; len--) {
        *dest++ = *src++;
    }

    // Zero uninitialized global data
    dest = &BSS_VIRT_START;
    for (len = &BSS_VIRT_END - &BSS_VIRT_START; len > 0; len--) {
        *dest++ = 0;
    }

    // Copy the default vector table
    src = &DEFAULT_VECTORS_LOAD_START;
    dest = &DEFAULT_VECTORS_VIRT_START;
    for (len = &DEFAULT_VECTORS_VIRT_END - &DEFAULT_VECTORS_VIRT_START; len > 0; len--) {
        *dest++ = *src++;
    }

    // Unmap the selectable mappings
    REG_MMU_SELECTOR_0 = 0;
    REG_MMU_SELECTOR_1 = 0;

    // TODO: Jump into the kernel proper.
    // for now, we just halt here.
    int i = 0;
    while (1) { i++; }
}

// init_vectors are the vectors that need to be at address 0 while
// the CPU is initializing.
// This is not a complete vector table but rather just the first
// two entries, which is enough to start executing the boot function.
const void *init_vectors[2] __attribute__((section(".initvectors"))) = {
    &KERNEL_STACK_BOTTOM, // initial kernel stack pointer
    &boot // initial program counter
};

// vectors are the "real" vectors that will be installed into the
// exception table by the boot function and then later modified
// further by the kernel proper
const void *vectors[256] __attribute__((section(".vectors"))) = {
    (void*)0, // initial stack pointer not used
    (void*)0  // initial program counter not used
    // TODO: remainder of the initial vectors
};

