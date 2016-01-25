
MUSASHI_DIR := ./musashi
MUSASHI_GENERATOR := $(MUSASHI_DIR)/m68kmake
MUSASHI_GENERATED_C_FILES := $(MUSASHI_DIR)/m68kops.c $(MUSASHI_DIR)/m68kopac.c $(MUSASHI_DIR)/m68kopdm.c $(MUSASHI_DIR)/m68kopnz.c
MUSASHI_GENERATED_H_FILES := $(MUSASHI_DIR)/m68kops.h
MUSASHI_C_FILES := $(MUSASHI_DIR)/m68kcpu.c $(MUSASHI_DIR)/m68kdasm.c
EMULATOR_C_FILES := emulator.c mmu.c memory.c gfx.c io.c

C_FILES := $(MUSASHI_C_FILES) $(MUSASHI_GENERATED_C_FILES) $(EMULATOR_C_FILES)
O_FILES := $(C_FILES:%.c=%.o)
H_FILES := $(MUSASHI_GENERATED_H_FILES) emulator.h mmu.h memory.h gfx.h io.h

C_FLAGS := $(shell sdl2-config --cflags)
LIBS := $(shell sdl2-config --static-libs)

all: emulator

emulator: $(O_FILES) $(H_FILES) Makefile
	gcc -o $@ $(O_FILES) $(LIBS)

$(MUSASHI_GENERATED_H_FILES) $(MUSASHI_GENERATED_C_FILES): $(MUSASHI_GENERATOR)
	cd $(MUSASHI_DIR) && ./m68kmake

%.o: %.c $(H_FILES)
	gcc -c -I $(MUSASHI_DIR) -o $@ $< $(C_FLAGS)

$(MUSASHI_GENERATOR): $(MUSASHI_GENERATOR).c
	gcc -o $@ $<

clean:
	rm -f $(O_FILES) $(MUSASHI_GENERATOR) $(MUSASHI_GENERATOR).o $(MUSASHI_GENERATED_C_FILES) $(MUSASHI_GENERATED_H_FILES) emulator

.PHONY: all emulator clean
