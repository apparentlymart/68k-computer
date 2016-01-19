`include "fake68k.v"
`include "ctrl.v"
`include "extmem.v"
`include "ioports.v"
`include "memmap.v"
`include "mmu.v"
`include "pgtbl.v"
`include "unmap.v"

module memmap_tb;
   `include "tap.vh"

   reg [(18*8)-1:0] test_name = 'bz;

   reg              sysclk = 0;
   reg              sysrst_n = 0;
   reg              cclk;
   wire [23:0]      logaddr;
   wire [19:12]     physaddr;
   wire             re_n;
   wire             we_n;
   wire [0:2]       ipl_n;
   wire             berr_n;
   wire             dtack_n;
   wire             w_n;
   wire             lds_n;
   wire             uds_n;
   wire             as_n;
   wire             cpuclk;
   wire [15:0]      d;
   wire             hsync;
   wire             vsync;
   wire             br_n;
   wire             bg_n;
   wire             csram1_n;
   wire             csram2_n;
   wire             csrom_n;
   wire             avec_n;
   wire             cpurst_n;
   wire             halt_n;
   wire [2:0]       fc;
   wire [3:0]       red;
   wire [3:0]       green;
   wire [3:0]       blue;

   reg [2:0]        cycle_type;
   reg [23:0]       mock_addr;
   reg [15:0]       mock_data_to_write;
   reg [2:0]        mock_fc;
   wire [15:0]      data_read;
   wire [4:0]       mock_state;

   prototype dut(sysclk,
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
                 avr_rx_busy);

   fake68k cpu(cpuclk,
               cycle_type,
               mock_addr,
               mock_data_to_write,
               mock_fc,
               data_read,
               mock_state,
               dtack_n,
               berr_n,
               fc,
               w_n,
               logaddr,
               d,
               as_n,
               uds_n,
               lds_n);

   always #1 begin
       sysclk <= ~sysclk;
   end

   task reset;
       begin
           #1;
           sysrst_n <= 0;
           #1;
           reset_mocks;
           sysrst_n <= 1;
           #4100; // Wait for the power-on reset delay
       end
   endtask

   task reset_mocks;
       begin
           cycle_type <= 'bz;
           mock_addr <= 'bz;
           mock_data_to_write <= 'bz;
           mock_fc <= 'bz;
       end
   endtask

   initial begin
       $dumpfile("prototype_tb.vcd");
       $dumpvars;
       $display("0..0");

       test_name <= 'bz;
       reset;

       #1 test_name <= "Read start vector ";
       cycle_type <= 1; // READ_CYCLE
       mock_addr <= 'd0;
       mock_fc <= 3'b110; // Supervisor Program
       #70;
       #1 test_name <= 'bz;
       reset_mocks;
       #1 test_name <= "Read initial SP   ";
       cycle_type <= 1; // READ_CYCLE
       mock_addr <= 'd4;
       mock_fc <= 3'b110; // Supervisor Program
       #60;
       #1 test_name <= 'bz;
       reset;

       $finish;
   end

endmodule
