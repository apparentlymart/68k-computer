
MODULES = $(shell find -type f -name '*.v' ! -name '*_tb.v')
TEST_BENCH_SOURCES = $(shell find -type f -name '*_tb.v')
TEST_BENCH_SIMS = $(patsubst %_tb.v,%_tb.vvp,$(TEST_BENCH_SOURCES))

# To use targets that depend on Xilinx tools, run make with
# XILINX_USE_ROOT=<path to ISE_DS dir>
# However, the design can be tested without Xilinx tools if
# iverilog and yosys are available, so Xilinx ISE is required
# only to prepare the design for a real logic device and if
# you want to simulate using Xilinx ISim.
XILINX_ISE_ROOT = /opt/Xilinx/14.5/ISE_DS
XILINX_LD_LIBRARY_PATH = $(XILINX_ISE_ROOT)/ISE/lib/lin:$(XILINX_ISE_ROOT)/EDK/lib/lin:$(XILINX_ISE_ROOT)/common/lib/lin
XILINX_PATH = $(XILINX_ISE_ROOT)/ISE/bin/lin:$(XILINX_ISE_ROOT)/ISE/sysgen/util:$(XILINX_ISE_ROOT)/ISE/../../../DocNav:$(XILINX_ISE_ROOT)/PlanAhead/bin:$(XILINX_ISE_ROOT)/EDK/bin/lin:$(XILINX_ISE_ROOT)/EDK/gnu/microblaze/lin/bin:$(XILINX_ISE_ROOT)/EDK/gnu/powerpc-eabi/lin/bin:$(XILINX_ISE_ROOT)/EDK/gnu/arm/lin/bin:$(XILINX_ISE_ROOT)/EDK/gnu/microblaze/linux_toolchain/lin32_be/bin:$(XILINX_ISE_ROOT)/EDK/gnu/microblaze/linux_toolchain/lin32_le/bin:$(XILINX_ISE_ROOT)/common/bin/lin:$(PATH)
XILINX=$(XILINX_ISE_ROOT)/ISE
XILINX_DSP=$(XILINX_ISE_ROOT)/ISE
XILINX_EDK=$(XILINX_ISE_ROOT)/EDK
XILINX_PLANAHEAD=$(XILINX_ISE_ROOT)/PlanAhead
XILINX_TOOL_ENV=PATH=$(XILINX_PATH) LD_LIBRARY_PATH=$(XILINX_LD_LIBRARY_PATH)

export XILINX
export XILINX_DSP
export XILINX_EDK
export XILINX_PLANAHEAD

synth:
	yosys -s glue.yosys

test: $(TEST_BENCH_SIMS)
	prove -f -e vvp $(TEST_BENCH_SIMS)

# Run this target as e.g.: make xilinx_isim_gui DUT=mmu
xilinx_isim_gui: $(DUT)_tb.texe
	$(XILINX_TOOL_ENV) ./$(DUT)_tb.texe -gui -view $(DUT)_tb.wcfg

gtkwave_gui: $(DUT)_tb.vcd
	gtkwave $(DUT)_tb.vcd $(DUT)_tb.gtkw

# Xilinx "Test Executable", for use with ISim
%_tb.texe: %_tb.v %.v
	$(XILINX_TOOL_ENV) fuse -incremental -prj glue_isim.prj -o $@ work.$(patsubst %_tb.texe,%_tb,$@)

%_tb.vvp: %_tb.v %.v
	iverilog $< $(patsubst %_tb.v,%.v,$<) -o $@

%_tb.vcd: %_tb.vvp
	vvp $<

.PHONY: synth test
