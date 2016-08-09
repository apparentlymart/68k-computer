
CROSS_COMPILE := m68k-unknown-elf-
TOOLCHAIN_PATH := $(CURDIR)/../cross-toolchain/gcc-m68k-elf/bin
CC := $(CROSS_COMPILE)gcc
LD := $(CROSS_COMPILE)gcc
GDB := $(CROSS_COMPILE)gdb
HOST_CC := gcc
HOST_LD := gcc
OBJCOPY := $(CROSS_COMPILE)objcopy

export PATH := $(TOOLCHAIN_PATH):$(PATH)

all: kernel.rom | cross-toolchain/gcc-m68k-elf/bin/$(CC)

kernel.rom: kernel/kernel.elf romulate
	./romulate $@ $<

romulate: romulate.o
	$(HOST_LD) $< -o $@

kernel/kernel.elf: kernel/Makefile $(shell find kernel -name '*.c') $(shell find kernel -name '*.h')
	cd kernel && $(MAKE) kernel.elf

%.o: %.c
	$(HOST_CC) -std=gnu11 -c $< -o $@

# 'debug' target assumes that the emulator is running, which starts a
# gdb-compatible server on port 6666.
debug:
	$(GDB) -iex "file kernel/kernel.elf" -iex "target remote 127.0.0.1:6666"

.PHONY: toolchain debug
