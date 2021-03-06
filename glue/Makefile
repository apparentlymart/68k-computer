
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
XILINX=$(XILINX_ISE_ROOT)/ISE
XILINX_DSP=$(XILINX_ISE_ROOT)/ISE
XILINX_EDK=$(XILINX_ISE_ROOT)/EDK
XILINX_PLANAHEAD=$(XILINX_ISE_ROOT)/PlanAhead
XILINX_TOOL=XILINX_ISE_ROOT=$(XILINX_ISE_ROOT) ./helpers/isetool

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
	@$(XILINX_TOOL) ./$(DUT)_tb.texe -gui -view $(DUT)_tb.wcfg

gtkwave_gui: $(DUT)_tb.vcd
	gtkwave $(DUT)_tb.vcd $(DUT)_tb.gtkw

# Xilinx "Test Executable", for use with ISim
%_tb.texe: %_tb.v %.v
	@$(XILINX_TOOL) fuse -incremental -prj glue_isim.prj -o $@ work.$(patsubst %_tb.texe,%_tb,$@)
	[ -e $@ ]

%_tb.vvp: %_tb.v %.v
	iverilog $< $(patsubst %_tb.v,%.v,$<) -o $@

%_tb.vcd: %_tb.vvp
	vvp $<

glue.ngc: $(MODULES) glue.prj glue.xst
	@$(XILINX_TOOL) xst -ifn glue.xst

prototype.ngc: $(MODULES) prototype.prj prototype.xst
	@$(XILINX_TOOL) xst -ifn prototype.xst
	[ -e $@ ]

%.ngd: %.ngc %.ucf
	@$(XILINX_TOOL) ngdbuild -uc $(patsubst %.ngc,%.ucf,$<) $< $@
	[ -e $@ ]

%.ncd: %.ngd
	@$(XILINX_TOOL) map -w $< -o $@
	[ -e $@ ]

%-par.ncd: %.ncd
	@$(XILINX_TOOL) par -w $< $@
	[ -e $@ ]

%.bit: %-par.ncd
	@$(XILINX_TOOL) bitgen -w -g Binary:Yes $< $@
	[ -e $@ ]

%.bin: %.bit
	[ -e $@ ]
	@echo "$@ was created as a side-effect of generating $<"

%.vpi: %.c
	iverilog-vpi $<

prototype: prototype.bin

prototype_synth:
	yosys -s prototype.yosys

xilinx_bitstream: glue.bin

clean:
	rm -f $(shell sed 's:#.*$$::g' .gitignore)

.PHONY: synth test prototype xilinx_bitstream clean
