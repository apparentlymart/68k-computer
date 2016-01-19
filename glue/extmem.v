// This is the memory controller for external memory (RAM and ROM).
//
// The external memory devices do most of the work here. We just make sure
// that the dtack signal is asserted. We assume that the RAM and ROM chips
// are fast enough that no CPU wait states are required, and so we can just
// assert dtack immediately.
module extmem(
    enable,
    clk,
    dtack,
    berr
);
   input enable;
   input clk;
   output dtack;
   output berr;

   assign dtack = enable ? 1'b1 : 'bz;
   assign berr = enable ? 1'b0 : 'bz;

endmodule
