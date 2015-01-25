
MODULES = $(shell find -type f -name '*.v' ! -name '*_tb.v')
TEST_BENCH_SOURCES = $(shell find -type f -name '*_tb.v')
TEST_BENCH_SIMS = $(patsubst %_tb.v,%_tb.vvp,$(TEST_BENCH_SOURCES))

%_tb.vvp: %_tb.v %.v
	iverilog $< $(patsubst %_tb.v,%.v,$<) -o $@

test: $(TEST_BENCH_SIMS)
	prove -e vvp $(TEST_BENCH_SIMS)

%_tb.vcd: %_tb.vvp
	vvp $<
