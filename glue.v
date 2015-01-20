/*
 Address decoding considers only the topmost 12 bits of the address, with
 the remainder passing directly to connected devices.

 The address decoding circuit is attached to a high-speed RAM that
 acts as the page table.

 Addresses are decoded differently depending on whether the fc outputs
 indicate supervisor or user mode.

 In supervisor mode, the address space is hard-coded as follows:
   kernel RAM 7MB
   kernel ROM 4MB
   IO ports 512k
   MMU registers 512k
   page table RAM 1MB
   video/audio controller RAM 1MB
   mapped pages from the physical address space 2MB

 The physical address space mapped pages are controlled by the supervisor
 memory access registers, providing two 1MB "windows" into the physical
 address space that can be used by kernel code to access memory from
 user applications.

 In user mode, the page table RAM is used in conjunction with the page
 configuration register.
   - page table RAM is arranged into tables of 4096 16-bit integers each.

   - the address lines for the page table RAM are asserted with the
     four high-order bits from the page configuration register and the
     remaining 12 low-order bits from the top half of the address bus.

   - the 16-bit output from the RAM becomes the highest-order bits of
     a 28-bit address in the physical address space.

 Physical address space is a 28-bit (256MB) space that the page table can
 select into, allowing user processes access to portions of the user RAM,
 the ROM and the video/audio controller RAM, with the latter allowing the
 kernel to allow applications to write directly to bitmaps in video RAM.
*/
module top(
   clk,
   reset_n,
   addr_in,
   addr_out,
   fc,
   as_n,
   uds_n,
   lds_n,
   read,
   dtack_n,
   berr_n,
   ipl_n,
   rom_enable_n,
   ram_enable_n
);
   input          clk;
   input          reset_n;
   input [23:12]  addr_in;
   output [27:12] addr_out;

   input [2:0]    fc;
   input          as_n;
   input          uds_n;
   input          lds_n;
   input          read;
   output         dtack_n;
   output         berr_n;
   output         ipl_n;

   output         rom_enable_n;
   output         ram_enable_n;

   wire           reset = ~reset_n;
   wire           as = ~as_n;
   wire           uds = ~uds_n;
   wire           lds = ~lds_n;
   wire           write = ~read;
   wire           dtack;
   wire           dtack_n = ~dtack;
   wire           berr;
   wire           berr_n = ~berr;
   wire           ipl;
   wire           ipl_n = ~ipl;
   wire           rom_enable;
   wire           rom_enable_n = ~rom_enable;
   wire           ram_enable;
   wire           ram_enable_n = ~ram_enable;

   // Asserted when the CPU is running in user mode rather than
   // supervisor mode.
   wire           user = (fc == 3'b001 || fc == 3'b010);

   reg [3:0]      page_config_select;
   reg [7:0]      supervisor_map_1;
   reg [7:0]      supervisor_map_2;

   localparam     IDLE = 0,
                  DECODE = 1,
                  READ = 2,
                  WRITE = 3,
                  BUS_ERROR = 4;

   reg [2:0]      state_d, state_q;
   reg [1:0]      boot_counter;

   always @(clk) begin
      if (reset) begin
         state_q <= IDLE;
         boot_counter <= 2'b11;
      end else begin
         state_q <= state_d;
      end

      case (state_q)
        IDLE: begin
           dtack = 0;
           berr = 0;
           rom_enable = 0;
           ram_enable = 0;
           if (as) begin
              state_d = DECODE;
           end
        end

        DECODE: begin
           if (boot_counter != 0) begin
              addr_out = 0;
              rom_enable = 1;
           end

           if (read) begin
              state_d = READ;
           end else begin
              state_d = WRITE;
           end
        end

        READ: begin
           if (boot_counter > 0) begin
              boot_counter = boot_counter - 1;
           end

           dtack = 1;

           state_d = IDLE;
        end

        WRITE: begin
           if (boot_counter > 0) begin
              boot_counter = boot_counter - 1;
           end

           if (rom_enable) begin
              berr = 1;
           end else begin
              dtack = 1;
           end

           state_d = IDLE;
        end
      endcase
   end

endmodule
