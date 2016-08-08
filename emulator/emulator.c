#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include "emulator.h"
#include <m68k.h>
#include "gdbserver.h"
#include "gfx.h"
#include "mmu.h"
#include "memory.h"
#include "io.h"

static Mode mode;

int main(int argc, char **argv) {
    int rom_fd = open("../os/kernel.rom", O_RDONLY);
    if (rom_fd == -1) {
        perror("Failed to open ROM image");
        return 1;
    }

    if (gfx_init() < 0) {
        fputs("Failed to initialize graphics system\n", stderr);
        return 1;
    }

    if (memory_init(rom_fd) < 0) {
        fputs("Failed to initialize memory system\n", stderr);
        return 1;
    }

    io_init();

    m68k_init();
    m68k_set_cpu_type(M68K_CPU_TYPE_68000);
    m68k_pulse_reset();

    mode = RUN;
    loop();

    return 0;
}

void loop(void) {
    int csock;

    while (mode != EXIT) {
        if (quit_soon) {
            mode = EXIT;
            continue;
        }

        switch (mode) {

        // Wait for a gdb process to connect
        case LISTEN:
            fputs("Waiting for GDB to connect\n", stderr);
            csock = gdbs_await_client(6666);
            fputs("GDB connected\n", stderr);
            mode = READ;
            break;

        // Wait for and then read a GDB command
        case READ:
            break;

        // Give the emulated CPU a timeslice
        case RUN:
        case STEP: // if step, we'll break after one instruction
            m68k_execute(1000000);
            io_update();
            gfx_update();
            break;

        // Signal to gdb that we're about to stop execution, and then
        // wait for a GDB command.
        case BREAK:
            mode = READ;
            break;

        default:
            fputs("Emulator harness entered invalid state\n", stderr);
            mode = EXIT;
            break;

        }
    }
}

unsigned int m68k_read_memory_8(unsigned int logaddr) {
    unsigned int physaddr = mmu_map_addr(logaddr);
    return read_memory_byte(physaddr);
}

unsigned int m68k_read_memory_16(unsigned int logaddr) {
    unsigned int physaddr = mmu_map_addr(logaddr);
    return (read_memory_byte(physaddr)<<8) | (read_memory_byte(physaddr + 1));
}

unsigned int m68k_read_memory_32(unsigned int logaddr) {
    // NB: this won't do the right thing if a 32-bit memory
    // access is not aligned to an even 4 bytes and straddles
    // across an MMU region boundary.
    unsigned int physaddr = mmu_map_addr(logaddr);
    return (
        (read_memory_byte(physaddr)<<24) |
        (read_memory_byte(physaddr + 1)<<16) |
        (read_memory_byte(physaddr + 2)<<8) |
        (read_memory_byte(physaddr + 3))
    );
}

void m68k_write_memory_8(unsigned int logaddr, unsigned int val) {
    unsigned int physaddr = mmu_map_addr(logaddr);
    write_memory_byte(physaddr, (unsigned char)val);
}

void m68k_write_memory_16(unsigned int logaddr, unsigned int val) {
    unsigned int physaddr = mmu_map_addr(logaddr);
    write_memory_byte(physaddr, (unsigned char)(val>>8));
    write_memory_byte(physaddr + 1, (unsigned char)val);
}

void m68k_write_memory_32(unsigned int logaddr, unsigned int val) {
    // NB: this won't do the right thing if a 32-bit memory
    // access is not aligned to an even 4 bytes and straddles
    // across an MMU region boundary.
    unsigned int physaddr = mmu_map_addr(logaddr);
    write_memory_byte(physaddr, (unsigned char)(val>>24));
    write_memory_byte(physaddr + 1, (unsigned char)(val>>16));
    write_memory_byte(physaddr + 2, (unsigned char)(val>>8));
    write_memory_byte(physaddr + 3, (unsigned char)val);
}

unsigned int m68k_read_disassembler_8(unsigned int logaddr) {
    disasm = 1;
    unsigned int ret = m68k_read_memory_8(logaddr);
    disasm = 0;
    return ret;
}

unsigned int m68k_read_disassembler_16(unsigned int logaddr) {
    disasm = 1;
    unsigned int ret = m68k_read_memory_16(logaddr);
    disasm = 0;
    return ret;
}

unsigned int m68k_read_disassembler_32(unsigned int logaddr) {
    disasm = 1;
    unsigned int ret = m68k_read_memory_32(logaddr);
    disasm = 0;
    return ret;
}

void make_hex(char* buff, unsigned int pc, unsigned int length) {
	char* ptr = buff;

	for( ; length>0; length -= 2) {
		sprintf(ptr, "%04x", m68k_read_memory_16(pc));
		pc += 2;
		ptr += 4;
		if(length > 2) {
			*ptr++ = ' ';
        }
	}
}

#define TRACE_INSTRUCTIONS
void on_each_instruction(void) {
#ifdef TRACE_INSTRUCTIONS
    static char buff[100];
	static char buff2[100];
	static unsigned int pc;
    static unsigned int pc_phys;
	static unsigned int instr_size;
    static const char *pc_dev;

	pc = m68k_get_reg(NULL, M68K_REG_PC);
    pc_phys = mmu_map_addr(pc);
    pc_dev = memory_device_name(pc_phys);
	instr_size = m68k_disassemble(buff, pc, M68K_CPU_TYPE_68000);
	make_hex(buff2, pc, instr_size);
	printf("E %4s %08x: %-20s: %s\n", pc_dev, pc, buff2, buff);
	fflush(stdout);
#endif
}
