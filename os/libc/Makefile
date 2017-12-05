
TARGET_DIR := ../cross-toolchain/gcc-m68k-elf
TARGET_TRIPLE := m68k-unknown-elf
TARGET_TRIPLE_OS := m68k-kiteos

export PATH := $(TARGET_DIR)/bin:$(PATH)

build:
	mkdir build

build/Makefile: build
	cd build && ../newlib/configure --target=$(TARGET_TRIPLE_OS)
