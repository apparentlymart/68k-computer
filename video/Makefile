
BASENAME=video
DEVICE=up5k
PACKAGE=sg48
VERILOG_SRC=timing.v testpattern.v
PIN_DEF=icebreaker.pcf

all: $(BASENAME).rpt $(BASENAME).bin

%.blif: %.v $(VERILOG_SRC)
	yosys -ql $*.log $(if $(USE_ARACHNEPNR),-DUSE_ARACHNEPNR) -p 'synth_ice40 -top top -blif $@' $< $(VERILOG_SRC)

%.json: %.v $(VERILOG_SRC)
	yosys -ql $*.log $(if $(USE_ARACHNEPNR),-DUSE_ARACHNEPNR) -p 'synth_ice40 -top top -json $@' $< $(VERILOG_SRC)

%.asc: $(PIN_DEF) %.json
	nextpnr-ice40 --$(DEVICE) $(if $(PACKAGE),--package $(PACKAGE)) $(if $(FREQ),--freq $(FREQ)) --json $(filter-out $<,$^) --pcf $< --asc $@

%.bin: %.asc
	icepack $< $@

%.rpt: %.asc
	icetime $(if $(FREQ),-c $(FREQ)) -d $(DEVICE) -mtr $@ $<

%_tb: %_tb.v %.v
	iverilog -g2005 -D 'DUMP_FILENAME="$@.vcd"' -o $@ $^

%_tb.vcd: %_tb
	vvp -N $< +vcd=$@

%_syn.v: %.blif
	yosys -p 'read_blif -wideports $^; write_verilog $@'

%_syntb: %_tb.v %_syn.v
	iverilog -o $@ $^ `yosys-config --datdir/ice40/cells_sim.v`

%_syntb.vcd: %_syntb
	vvp -N $< +vcd=$@

prog: $(BASENAME).bin
	iceprog $<

clean:
	rm -f $(BASENAME).blif $(BASENAME).asc $(BASENAME).rpt $(BASENAME).bin $(BASENAME).json $(BASENAME).log $(ADD_CLEAN)

.SECONDARY:
.PHONY: all prog clean
