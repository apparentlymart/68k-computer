// This is the memory controller for the control register region.
//
// This memory space contains registers that control glue logic operation. It's
// intended to be written by the supervisor to create an appropriate context
// for a user program.
//
// It contains the following registers, all 16-bit:
//     0x0    Supervisor Map 1: Chooses a 1MB physical memory region to map
//            into the first of the two supervisor-mode mapped memory pages.
//     0x1    Supervisor Map 2: Chooses a 1MB physical memory region to map
//            into the second of the two supervisor-mode mapped memory pages.
//     0x3    User Map Selector: Chooses which page table is used in user mode.
//            Each user process will have a unique value. Only the three least
//            significant bits are used.
module ctrl(
    enable,
    clk,
    d,
    addr,
    lds,
    uds,
    write,
    dtack,
    berr,
    user_map,
    supervisor_map_1,
    supervisor_map_2
);
   input         enable;
   input         clk;
   inout [15:0]  d;
   input [1:0]   addr;
   input         lds;
   input         uds;
   input         write;
   output        dtack;
   output        berr;
   output [3:0]  user_map;
   output [15:0] supervisor_map_1;
   output [15:0] supervisor_map_2;

   reg [15:0]    mem[0:3];
   reg [15:0]    d_out;

   assign supervisor_map_1 = mem[0];
   assign supervisor_map_2 = mem[1];
   assign user_map = mem[2][3:0];
   assign d = (enable & ~write) ? d_out : 'bz;
   assign dtack = enable ? 1'b1 : 'bz;
   assign berr = enable ? 1'b0 : 'bz;

   always @(posedge clk) begin
       if (write & enable) begin
           if (lds)
             mem[addr][7:0] <= d[7:0];
           if (uds)
             mem[addr][15:8] <= d[15:8];
       end
       d_out <= mem[addr];
   end

endmodule
