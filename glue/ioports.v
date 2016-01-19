// This is the memory controller for I/O ports.
//
// We don't have any I/O ports yet, so this does nothing.
module ioports(
    enable,
    clk,
    d,
    addr,
    lds,
    uds,
    write,
    dtack,
    berr
);
   input        enable;
   input        clk;
   inout [15:0] d;
   input [7:0]  addr;
   input        lds;
   input        uds;
   input        write;
   output dtack;
   output berr;

   assign dtack = enable ? 1'b1 : 'bz;
   assign berr = enable ? 1'b0 : 'bz;
   assign d = (enable & ~write) ? 16'h0000 : 'bz;

endmodule
