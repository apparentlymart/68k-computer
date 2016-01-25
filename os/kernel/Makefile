
CROSS_COMPILE := m68k-unknown-elf-
TOOLCHAIN_PATH := $(CURDIR)/../cross-toolchain/gcc-m68k-elf/bin
CC := $(CROSS_COMPILE)gcc
LD := $(CROSS_COMPILE)gcc
AS := $(CROSS_COMPILE)as
OBJCOPY := $(CROSS_COMPILE)objcopy

C_FILES := $(shell find -name "*.c")
AS_FILES := $(shell find -name "*.s")
O_FILES := $(patsubst %.s,%.o,$(AS_FILES)) $(patsubst %.c,%.o,$(C_FILES))

export PATH := $(TOOLCHAIN_PATH):$(PATH)

kernel.elf: $(O_FILES) kernel.ld
	$(LD) -g -nostdlib -Tkernel.ld $(O_FILES) -o $@ -m68000

%.o: %.c
	$(CC) -g -c $< -o $@ -m68000

%.o: %.s
	$(AS) $< -o $@ -m68000

toolchain:
	@[ -e $(TOOLCHAIN_PATH)/$(CC) ] || (echo "First build the compiler toolchain in $(TOOLCHAIN_PATH)"; exit 1)

.PHONY: toolchain
