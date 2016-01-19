// This is the memory controller for the unmapped memory region.
//
// This is a dummy memory region that unconditionally generates a bus error
// when accessed. It appears at physical address zero and is intended to be used
// as a placeholder for user memory pages that aren't being used.
module unmap(
    enable,
    clk,
    dtack,
    berr
);
   input enable;
   input clk;
   output dtack;
   output berr;

   assign dtack = enable ? 1'b0 : 'bz;
   assign berr = enable ? 1'b1 : 'bz;

endmodule
