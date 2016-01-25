
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

void default_bus_error(void) {
    long int i = 0;
    while (1) {
        i = 0xdeadbeef;
    }
}

// init_vectors are the vectors that need to be at address 0 while
// the CPU is initializing.
// This is not a complete vector table but rather just the first
// two entries, which is enough to start executing the boot function.
const void *init_vectors[3] __attribute__((section(".initvectors"))) = {
    &KERNEL_STACK_BOTTOM, // initial kernel stack pointer
    &init, // initial program counter
    &default_bus_error
};

// vectors are the "real" vectors that will be installed into the
// exception table by the boot function and then later modified
// further by the kernel proper
const void *vectors[256] __attribute__((section(".vectors"))) = {
    (void*)0, //  0 initial stack pointer not used
    (void*)0, //  1 initial program counter not used
    &default_bus_error, //  2 bus error
    (void*)0, //  3 address error
    (void*)0, //  4 illegal instruction
    (void*)0, //  5 division by zero
    (void*)0, //  6 CHK instruction
    (void*)0, //  7 TRAPV instruction
    (void*)0, //  8 privilege violation
    (void*)0, //  9 trace
    (void*)0, // 10 unimplemented instruction
    (void*)0, // 11 unimplemented instruction
    (void*)0, // 12 reserved
    (void*)0, // 13 reserved
    (void*)0, // 14 reserved
    (void*)0, // 15 uninitialized interrupt vector
    (void*)0, // 16 reserved
    (void*)0, // 17 reserved
    (void*)0, // 18 reserved
    (void*)0, // 19 reserved
    (void*)0, // 20 reserved
    (void*)0, // 21 reserved
    (void*)0, // 22 reserved
    (void*)0, // 23 reserved
    (void*)0, // 24 spurious interrupt
    (void*)0, // 25 auto-vector 1
    (void*)0, // 26 auto-vector 2
    (void*)0, // 27 auto-vector 3
    (void*)0, // 28 auto-vector 4
    (void*)0, // 29 auto-vector 5
    (void*)0, // 30 auto-vector 6
    (void*)0, // 31 auto-vector 7
    (void*)0, // 32 TRAP 0
    (void*)0, // 33 TRAP 1
    (void*)0, // 34 TRAP 2
    (void*)0, // 35 TRAP 3
    (void*)0, // 36 TRAP 4
    (void*)0, // 37 TRAP 5
    (void*)0, // 38 TRAP 6
    (void*)0, // 39 TRAP 7
    (void*)0, // 40 TRAP 8
    (void*)0, // 41 TRAP 9
    (void*)0, // 42 TRAP 10
    (void*)0, // 43 TRAP 11
    (void*)0, // 44 TRAP 12
    (void*)0, // 45 TRAP 13
    (void*)0, // 46 TRAP 14
    (void*)0, // 47 TRAP 15
    (void*)0, // 48 reserved
    (void*)0, // 49 reserved
    (void*)0, // 50 reserved
    (void*)0, // 51 reserved
    (void*)0, // 52 reserved
    (void*)0, // 53 reserved
    (void*)0, // 54 reserved
    (void*)0, // 55 reserved
    (void*)0, // 56 reserved
    (void*)0, // 57 reserved
    (void*)0, // 58 reserved
    (void*)0, // 59 reserved
    (void*)0, // 60 reserved
    (void*)0, // 61 reserved
    (void*)0, // 62 reserved
    (void*)0, // 63 reserved

    // User interrupt vectors
    (void*)0, // 64 .. 255
};

