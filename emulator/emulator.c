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
#include "schedtimer.h"

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
    schedtimer_init();

    m68k_init();
    m68k_set_cpu_type(M68K_CPU_TYPE_68000);
    m68k_pulse_reset();

    mode = LISTEN;
    schedtimer_enable();
    loop();
    schedtimer_disable();

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
            schedtimer_disable();
            fputs("Waiting for GDB to connect\n", stderr);
            csock = gdbs_await_client(6666);
            if (csock < 0) {
                fputs("Failed while waiting for GDB to connect\n", stderr);
                return;
            }
            fputs("GDB connected\n", stderr);
            schedtimer_enable();
            mode = READ;
            break;

        // Wait for and then read a GDB command
        case READ:
            schedtimer_disable();
            mode = gdbs_handle_command(csock);
            schedtimer_enable();
            break;

        // Give the emulated CPU a timeslice
        case RUN:
        case STEP: // if step, we'll deal with it in on_each_instruction
            m68k_execute(1000000);
            io_update();
            gfx_update();
            break;

        // Signal to gdb that we're about to stop execution, and then
        // wait for a GDB command.
        case BREAK:
            mode = gdbs_handle_break(csock);
            break;

        default:
            fputs("Emulator harness entered invalid state\n", stderr);
            mode = EXIT;
            break;

        }
    }
}

static char *exc_vector_name[] = {
    // These first two are not actually exceptions, but they do occupy
    // slots in the vector table.
    "Initial Stack Pointer",
    "Initial Program Counter",

    // Primary CPU exceptions
    "Bus Error",
    "Address Error",
    "Illegal Instruction",
    "Zero Divide",
    "CHK instruction",
    "TRAPV instruction",
    "Privilege violation",
    "Trace",
    "Line 1010 emulator",
    "Line 1111 emulator",
    "(reserved)",
    "(reserved)",
    "(reserved)",
    "Uninitialized interrupt vector",
    "(reserved)",
    "(reserved)",
    "(reserved)",
    "(reserved)",
    "(reserved)",
    "(reserved)",
    "(reserved)",
    "(reserved)",
    "Spurious interrupt",
    "Level 1 interrupt autovector",
    "Level 2 interrupt autovector",
    "Level 3 interrupt autovector",
    "Level 4 interrupt autovector",
    "Level 5 interrupt autovector",
    "Level 6 interrupt autovector",
    "Level 7 interrupt autovector",
    "TRAP 0",
    "TRAP 1",
    "TRAP 2",
    "TRAP 3",
    "TRAP 4",
    "TRAP 5",
    "TRAP 6",
    "TRAP 7",
    "TRAP 8",
    "TRAP 9",
    "TRAP 10",
    "TRAP 11",
    "TRAP 12",
    "TRAP 13",
    "TRAP 14",
    "TRAP 15",
    "(reserved)",
    "(reserved)",
    "(reserved)",
    "(reserved)",
    "(reserved)",
    "(reserved)",
    "(reserved)",
    "(reserved)",
    "(reserved)",
    "(reserved)",
    "(reserved)",
    "(reserved)",
    "(reserved)",
    "(reserved)",
    "(reserved)",
    "(reserved)"
};

void maybe_log_memory_read(unsigned int physaddr) {
    if (physaddr > 0x8000000 && physaddr < (0x8000000 + (255 * 4))) {
        // Reading an exception vector, which is useful to log since
        // it'll sometimes result in some sort of OS crash that we'll want
        // to debug.
        // (Exception vectors are at the bottom of kernel RAM, which
        // is at 0x8000000 in the *physical* memory map.)
        int vector = (physaddr - 0x8000000) / 4;
        char * vector_name = vector < 64 ? exc_vector_name[vector] : "Interrupt";
        fprintf(stderr, "--- read exception vector %i (%s)\n", vector, vector_name);
    }
}

unsigned int m68k_read_memory_8(unsigned int logaddr) {
    unsigned int physaddr = mmu_map_addr(logaddr);
    maybe_log_memory_read(physaddr);
    return read_memory_byte(physaddr);
}

unsigned int m68k_read_memory_16(unsigned int logaddr) {
    unsigned int physaddr = mmu_map_addr(logaddr);
    maybe_log_memory_read(physaddr);
    return (read_memory_byte(physaddr)<<8) | (read_memory_byte(physaddr + 1));
}

unsigned int m68k_read_memory_32(unsigned int logaddr) {
    // NB: this won't do the right thing if a 32-bit memory
    // access is not aligned to an even 4 bytes and straddles
    // across an MMU region boundary.
    unsigned int physaddr = mmu_map_addr(logaddr);
    maybe_log_memory_read(physaddr);

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

int on_interrupt(int level) {
    // FIXME: For the moment the real system's interrupt controller
    // hasn't been designed, so we can't emulate it yet.
    // Instead, we'll just hard-code that interrupt level 1 is always
    // the timeslice interrupt, and map it to the first user interrupt
    // vector, 64.

    switch (level) {
    case 1:
        // For now, we immediately clear the interrupt. Once we have
        // a real interrupt controller to emulate things might get
        // more interesting, though probably it'll just clear itself
        // as part of the interrupt acknowledge cycle and effectively
        // behave this way.
        m68k_set_irq(0);
        return 64;
    }

    fprintf(stderr, "Spurious interrupt at level %i\n", level);
    return M68K_INT_ACK_SPURIOUS;
}

//#define TRACE_INSTRUCTIONS
int on_each_instruction(void) {
	static unsigned int pc;
	pc = m68k_get_reg(NULL, M68K_REG_PC);


#ifdef TRACE_INSTRUCTIONS
    static char buff[100];
	static char buff2[100];
    static unsigned int pc_phys;
	static unsigned int instr_size;
    static const char *pc_dev;

    pc_phys = mmu_map_addr(pc);
    pc_dev = memory_device_name(pc_phys);
	instr_size = m68k_disassemble(buff, pc, M68K_CPU_TYPE_68000);
	make_hex(buff2, pc, instr_size);
#endif

    if (mode == STEP) {
        // If we're stepping then we want to only run one instruction
        // at a time, so we'll steal the emulated CPU's timeslice
        // (force it to return control to the main loop) and enter
        // BREAK mode so gdb will regain control.
        m68k_end_timeslice();
        mode = BREAK;

        // Execute this unstruction, but since we've stolen the timeslice
        // we'll return to the mainloop before executing the next one.
#ifdef TRACE_INSTRUCTIONS
        printf("E %4s %08x: %-20s: %s\n", pc_dev, pc, buff2, buff);
        fflush(stdout);
#endif
        return 0;
    }

    if (gdbs_has_breakpoint(pc)) {
        mode = BREAK;
        // Stop executing before we run this instruction, so we can
        // break into the debugger at the right point.
        return 1;
    }

    // Execute instruction as normal.
#ifdef TRACE_INSTRUCTIONS
    printf("E %4s %08x: %-20s: %s\n", pc_dev, pc, buff2, buff);
    fflush(stdout);
#endif
    return 0;
}
