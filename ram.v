module ram(addr, data, enable, write);
   parameter ADDR_WIDTH = 16;
   parameter DATA_WIDTH = 16;
   parameter RAM_SIZE = 1 << ADDR_WIDTH;

   input [ADDR_WIDTH-1:0] addr;
   inout [DATA_WIDTH-1:0] data;
   input                  enable;
   input                  write;

   reg [DATA_WIDTH-1:0] memory [0:RAM_SIZE-1];
   reg [DATA_WIDTH-1:0] data_out;

   // Only assert data bus when enabled and not in write mode.
   assign data = (enable && !write) ? memory[addr] : 'bz;

   always @(posedge enable) begin
      if (write) begin
         memory[addr] <= data;
      end
   end

endmodule
