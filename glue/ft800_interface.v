/*

 The FT800 chip uses an SPI interface to a 22-bit address space. This module
 is an adapter to make the chip accessible via a traditional parallel
 interface so it can be mapped into the system's physical memory map.

*/
module ft800_interface(rst,
                       clk,
                       addr,
                       data,
                       write,
                       command,
                       enable,
                       complete,
                       mosi,
                       miso,
                       chip_select,
                       spi_clk);

   input        rst;
   input        clk;

   input [21:1] addr;
   inout [15:0] data;

   input        write;
   input        command;
   input        enable;

   output       complete;

   output       mosi;
   input        miso;
   output       chip_select;
   output       spi_clk;

   reg [39:0]   write_data = 0;
   reg [15:0]   read_data = 0;
   reg [5:0]    write_counter = 0;
   reg [4:0]    read_counter = 0;
   reg          complete_data = 0;

   reg          chip_select_data = 0;
   reg [1:0]    cycle = 0;

   assign data = (enable && write_counter == 0 && read_counter == 0 && ~write) ? read_data : 'bz;
   assign mosi = write_data[39];
   assign chip_select = (chip_select_data & ~complete & enable);
   assign spi_clk = (cycle == 2 && chip_select);
   assign complete = complete_data;

   task handle_command;
      begin
      end
   endtask

   task handle_data;
      begin
         if (write) handle_write;
         else handle_read;
      end
   endtask

   task handle_write;
      begin
         write_data <= {
             2'b10, // 2 bit 'write' opcode
             addr, 1'b0, // 22-bit address (bit zero always zero)
             data // 16-bit data
         };
         start_spi_transfer(40, 0);
      end
   endtask

   task handle_read;
      begin
         write_data <= {
             2'b00, // 2 bit 'read' opcode
             addr, 1'b0, // 22-bit address (bit zero always zero)
             8'h0, // dummy byte
             8'h0 // padding to fill the rest of the register
         };
         start_spi_transfer(32, 16);
      end
   endtask

   task start_spi_transfer;
      input [5:0] bits_to_write;
      input [4:0] bits_to_read;
      begin
         chip_select_data <= 1;
         write_counter <= bits_to_write - 1;
         read_counter <= bits_to_read;
      end
   endtask

   task shift;
      begin
         if (write_counter > 0) begin
            write_data <= {write_data[38:0], 1'b0};
            write_counter <= write_counter - 1;
         end else if (read_counter > 0) begin
            read_data <= {read_data[14:0], miso};
            read_counter <= read_counter - 1;
         end else begin
            complete_data <= 1;
         end
      end
   endtask

   always @(posedge enable) begin
      if (command) handle_command;
      else handle_data;
   end

   always @(negedge enable) begin
      complete_data <= 0;
      chip_select_data <= 0;
   end

   always @(posedge clk) begin
      if (rst | ~enable)
        cycle <= 0;
      else
        cycle <= cycle + 1;

      case (cycle)
        3: shift;
      endcase
   end

endmodule
