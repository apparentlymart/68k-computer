
BINUTILS_VERSION := 2.25
GCC_VERSION := 5.3.0
ROOT_DIR := $(CURDIR)
TARGET_DIR := gcc-m68k-elf
TARGET_PREFIX := $(ROOT_DIR)/$(TARGET_DIR)
TARGET_TRIPLE := m68k-unknown-elf

export PATH := $(TARGET_DIR)/bin:$(PATH)

$(TARGET_DIR): $(TARGET_DIR)/bin/$(TARGET_TRIPLE)-gcc

src:
	mkdir -p src

src/binutils-$(BINUTILS_VERSION).tar.bz2: | src
	wget http://ftp.gnu.org/gnu/binutils/binutils-$(BINUTILS_VERSION).tar.bz2 -O $@

src/gcc-core-$(GCC_VERSION).tar.bz2: | src
	wget http://ftp.gnu.org/gnu/gcc/gcc-$(GCC_VERSION)/gcc-$(GCC_VERSION).tar.bz2 -O $@

src/binutils-$(BINUTILS_VERSION): src/binutils-$(BINUTILS_VERSION).tar.bz2
	tar jxf $< -C src

src/gcc-$(GCC_VERSION): src/gcc-core-$(GCC_VERSION).tar.bz2
	tar jxf $< -C src

build:
	mkdir -p build

build/binutils: build
	mkdir -p build/binutils

build/gcc: build
	mkdir -p build/gcc

build/binutils/Makefile: | build/binutils src/binutils-$(BINUTILS_VERSION)
	cd build/binutils && ../../src/binutils-$(BINUTILS_VERSION)/configure --target=$(TARGET_TRIPLE) --prefix=$(TARGET_PREFIX) --disable-nls --with-sysroot

build/gcc/Makefile: $(TARGET_DIR)/bin/$(TARGET_TRIPLE)-objdump | build/gcc src/gcc-$(GCC_VERSION)
	cd build/gcc && ../../src/gcc-$(GCC_VERSION)/configure --target=$(TARGET_TRIPLE) --prefix=$(TARGET_PREFIX) --disable-libssp --disable-threads --enable-languages=c --with-build-time-tools=$(TARGET_DIR)/bin --with-dwarf2 --disable-libgomp --disable-libada --disable-libquadmath --disable-nls --without-headers

build/binutils/binutils/objdump: | build/binutils/Makefile
	cd build/binutils && make -j 3

$(TARGET_DIR)/bin/$(TARGET_TRIPLE)-objdump: build/binutils/binutils/objdump
	cd build/binutils && make install

build/gcc/gcc/xgcc: | build/gcc/Makefile
	cd build/gcc && make -j 3

$(TARGET_DIR)/bin/$(TARGET_TRIPLE)-gcc: build/gcc/gcc/xgcc
	cd build/gcc && make install

clean:
	rm -rf $(shell cat .gitignore)

try: try.bin

try.bin: try.elf
	m68k-unknown-elf-objcopy -I elf32-m68k -O binary $< $@

try.elf: try.o
	m68k-unknown-elf-gcc -nostdlib $< -o $@

try.o: try.c
	m68k-unknown-elf-gcc -c $< -o $@

.PHONY: clean try

# Treat the download archives as precious so we don't need to download them
# repeatedly when running repeated builds.
.PRECIOUS: src/binutils-$(BINUTILS_VERSION).tar.bz2 src/gcc-core-$(GCC_VERSION).tar.bz2 build/gcc/gcc/xgcc build/binutils/binutils/objdump
