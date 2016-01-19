/*
 The memory mapper's task is to take a physical address (the output from the MMU)
 and enable the appropriate chip select signals to turn on whatever device
 services the relevant portion of memory.

 The physical memory map is as follows:
     0x0000000 1MB of unmapped address space, producing a bus error
     0x0100000 2x512kB board control registers
     0x0200000 2x512kB user mode page table
     0x0300000 1MB Primary I/O ports
     ... (unassigned memory space, where accesses cause undefined behavior)
     0x3c00000 4MB display and sound controller
     0x4000000 64MB ROM
     0x8000000 128MB RAM

 In the prototype not all of the above mentioned devices are present, or aren't
 necessarily as big as the above table suggests. In the latter case, the smaller
 placeholder device is repeated multiple times in the assigned space but only
 the lowest instance may be used.

 The input clock signal should be the 50MHz system clock rather than the CPU
 clock. This ensures that the memory mapper is not a performance bottleneck.

 Outputs are updated only on a rising edge of the clock, although the enable
 signal has an immediate effect, forcing all of the outputs low if not asserted.
 */
module memmap(
    enable,
    clk,

    addr_in,

    csunmap,
    csram1,
    csram2,
    csrom,
    csio,
    csgfx,
    csctrl,
    cspgtbl
);
   input         enable;
   input         clk;
   input [27:20] addr_in;

   output        csunmap;
   output        csram1;
   output        csram2;
   output        csrom;
   output        csio;
   output        csgfx;
   output        csctrl;
   output        cspgtbl;

   reg           csunmap_r = 'b0;
   reg           csram1_r = 'b0;
   reg           csram2_r = 'b0;
   reg           csrom_r = 'b0;
   reg           csio_r = 'b0;
   reg           csgfx_r = 'b0;
   reg           csctrl_r = 'b0;
   reg           cspgtbl_r = 'b0;

   assign        csunmap = enable ? csunmap_r : 1'b0;
   assign        csram1 = enable ? csram1_r : 1'b0;
   assign        csram2 = enable ? csram2_r : 1'b0;
   assign        csrom = enable ? csrom_r : 1'b0;
   assign        csio = enable ? csio_r : 1'b0;
   assign        csgfx = enable ? csgfx_r : 1'b0;
   assign        csctrl = enable ? csctrl_r : 1'b0;
   assign        cspgtbl = enable ? cspgtbl_r : 1'b0;

   always @(posedge clk)
     begin
         csunmap_r <= 'b0;
         csram1_r <= 'b0;
         csram2_r <= 'b0;
         csrom_r <= 'b0;
         csio_r <= 'b0;
         csgfx_r <= 'b0;
         csctrl_r <= 'b0;
         cspgtbl_r <= 'b0;

         casex (addr_in)
           8'b00000000:
             csunmap_r <= 1'b1;
           8'b00000001:
             csctrl_r <= 1'b1;
           8'b00000010:
             cspgtbl_r <= 1'b1;
           8'b00000011:
             csio_r <= 1'b1;
           8'b001111xx:
             csgfx_r <= 1'b1;
           8'b01xxxxxx:
             csrom_r <= 1'b1;
           8'b10xxxxxx:
             csram1_r <= 1'b1;
           8'b11xxxxxx:
             csram2_r <= 1'b1;
         endcase
     end

endmodule
