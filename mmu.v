/*
 The MMU's task is to map 24-bit addresses from the running program onto
 28-bit physical addresses that are understood by the address decoder circuit.

 MMU considers only the topmost 12 bits of the address, with the remainder
 passing directly to connected devices.

 The MMU circuit is attached to a dual-port RAM that acts as the page table:
 http://www.digikey.com/product-detail/en/70V261L25PFG/800-1390-ND/1915691

 Addresses are mapped differently depending on whether the fc outputs
 indicate supervisor or user mode.

 In supervisor mode, the address space is hard-coded as follows:
   kernel RAM 2MB
   kernel ROM 2MB
   IO ports 512k
   MMU registers 256k
   page table RAM 256k
   video/audio controller RAM 8MB
   mapped pages from the physical address space 2MB
   1MB unused

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
module mmu(
   addr_in,
   addr_in_strobe,
   fc,

   user_map,
   supervisor_map_1,
   supervisor_map_2,
   table_ram_addr_bus,
   table_ram_data_bus,

   addr_out,
   addr_out_strobe
);

   input [23:12]  addr_in;
   input          addr_in_strobe;
   input [2:0]    fc;

   input [3:0]    user_map;
   input [7:0]    supervisor_map_1;
   input [7:0]    supervisor_map_2;
   output [19:0]  table_ram_addr_bus;
   input [15:0]   table_ram_data_bus;

   output [27:12] addr_out;
   output         addr_out_strobe;

   // Asserted when the CPU is running in user mode rather than
   // supervisor mode.
   wire           user = (fc == 3'b001 || fc == 3'b010);

   assign table_ram_addr_bus = 'bz;

   always @(posedge addr_in_strobe) begin

      if (user) begin
         
      end else begin

      end

   end

endmodule
