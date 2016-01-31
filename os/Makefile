
CROSS_COMPILE := m68k-unknown-elf-
TOOLCHAIN_PATH := $(CURDIR)/../cross-toolchain/gcc-m68k-elf/bin
CC := $(CROSS_COMPILE)gcc
LD := $(CROSS_COMPILE)gcc
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

.PHONY: toolchain
