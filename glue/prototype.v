module prototype(
   sysclk,
   sysrst_n,
   cclk,
   logaddr,
   physaddr,
   re_n,
   we_n,
   ipl_n,
   berr_n,
   dtack_n,
   w_n,
   lds_n,
   uds_n,
   as_n,
   cpuclk,
   d,
   hsync,
   vsync,
   br_n,
   bg_n,
   csram1_n,
   csram2_n,
   csrom_n,
   avec_n,
   cpurst_n,
   halt_n,
   fc,
   red,
   green,
   blue,

   spi_mosi,
   spi_miso,
   spi_ss,
   spi_sck,
   spi_channel,

   avr_tx,
   avr_rx,
   avr_rx_busy
);
   input              sysclk;
   input              sysrst_n;
   input              cclk;
   input [23:0]       logaddr;
   output [19:12]     physaddr;
   output             re_n;
   output             we_n;
   output [0:2]       ipl_n;
   output             berr_n;
   output             dtack_n;
   input              w_n;
   input              lds_n;
   input              uds_n;
   input              as_n;
   output             cpuclk;
   inout [15:0]       d;
   output             hsync;
   output             vsync;
   output             br_n;
   input              bg_n;
   output             csram1_n;
   output             csram2_n;
   output             csrom_n;
   output             avec_n;
   output             cpurst_n;
   output             halt_n;
   input [2:0]        fc;
   output [3:0]       red;
   output [3:0]       green;
   output [3:0]       blue;

   input              spi_mosi;
   output             spi_miso;
   input              spi_ss;
   input              spi_sck;
   output [3:0]       spi_channel;

   input              avr_tx;
   output             avr_rx;
   input              avr_rx_busy;

   wire               sysrst = ~sysrst_n;
   wire               as = ~as_n;

   wire               csram1;
   wire               csram2;
   wire               csrom;
   wire               csio;
   wire               csunmap;
   wire               csgfx;
   wire               csctrl;
   wire               cspgtbl;
   wire               berr;
   wire               dtack;
   wire               br;
   wire               pas; // Physical address strobe.
   wire [27:12]       mmu_out;
   wire [3:0]         mmu_user_map;
   wire [15:0]        mmu_supervisor_map_1;
   wire [15:0]        mmu_supervisor_map_2;
   wire [27:0]        physaddr_full = as ? {mmu_out, logaddr[11:0]} : 'bz;

   // External view of physical memory access.
   // The top of the address is replaced by the external chip select
   // signals. The chip select signals may be all unasserted, if the
   // physical address selected is one that will be resolved internally.
   wire               csram1_n = ~csram1;
   wire               csram2_n = ~csram2;
   wire               csrom_n = ~csrom;
   assign             physaddr = physaddr_full[19:12];

   // Signals to CPU
   assign dtack_n = pas ? ~dtack : 'b1;
   assign berr_n = pas ? ~berr : 'b1;
   assign br_n = ~br;

   // These must be high impedence when not in use
   assign spi_miso = 1'bz;
   assign avr_rx = 1'bz;
   assign spi_channel = 4'bzzzz;

   // sysclk is 50MHz
   // cpuclk is 6.25MHz, or sysclk / 8
   reg [2:0]          cpuclk_count;
   always @(posedge sysclk or negedge sysrst_n)
     begin
         if (!sysrst_n)
             cpuclk_count <= 3'd0;
         else
             cpuclk_count <= cpuclk_count + 1;
     end
   assign cpuclk = cpuclk_count[2];

   // on first startup, assert RESET for a while to let
   // things stabilize.
   reg [7:0] reset_count;
   always @(posedge cpuclk or negedge sysrst_n)
     begin
         if (!sysrst_n)
           reset_count <= 'd1;
         else if (reset_count != 0)
           reset_count <= reset_count + 1;
     end
   assign cpurst_n = reset_count == 0;
   assign halt_n = cpurst_n;

   // Not using DMA yet, so no need to do bus negotiation
   assign br = 1'b0;

   // These things will be used later, but not used yet.
   assign physaddr = 12'bzzzzzzzzzzzz;
   assign re_n = 1'bz;
   assign we_n = 1'bz;
   assign ipl_n = 3'bz;
   assign hsync = 1'bz;
   assign vsync = 1'bz;
   assign avec_n = 1'bz;
   assign red = 4'bzzzz;
   assign green = 4'bzzzz;
   assign blue = 4'bzzzz;

   memmap memmap_m(as,
                   sysclk,
                   mmu_out[27:20],
                   csunmap,
                   csram1,
                   csram2,
                   csrom,
                   csio,
                   csgfx,
                   csctrl,
                   cspgtbl,
                   pas);

   mmu mmu_m(as,
             logaddr[23:12],
             fc,
             mmu_user_map,
             mmu_supervisor_map_1,
             mmu_supervisor_map_2,
             table_addr,
             table_data,
             mmu_out);

   ctrl ctrl_m(csctrl,
               sysclk,
               d,
               physaddr_full[1:0],
               lds,
               uds,
               we,
               dtack,
               berr,
               mmu_user_map,
               mmu_supervisor_map_1,
               mmu_supervisor_map_2);

   pgtbl pgtbl_m(cspgtbl,
                 sysclk,
                 d,
                 physaddr_full[7:0],
                 lds,
                 uds,
                 we,
                 dtack,
                 berr);

   unmap unmap_m(csunmap,
                 sysclk,
                 dtack,
                 berr);

   extmem extmem_m(csram1 | csram2 | csrom,
                   sysclk,
                   dtack,
                   berr);
   // For the moment we don't have any external memory
   // chips connected, so we'll just fake it.
   assign d = (csram1 | csram2 | csrom) ? 16'h0000 : 'bz;

   ioports ioports_m(csio,
                     sysclk,
                     d,
                     physaddr_full[7:0],
                     lds,
                     uds,
                     we,
                     dtack,
                     berr);

endmodule
