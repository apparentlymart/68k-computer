module glue(
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

   reg [3:0]      page_config_select;
   reg [7:0]      supervisor_map_1;
   reg [7:0]      supervisor_map_2;

   // TODO: External connections for the page table RAM.
   wire [15:0]    table_ram_addr_bus;
   wire [15:0]    table_ram_data_bus;

   // TODO: Physical address decoding.

   mmu dut(as,
           addr_in,
           fc,
           page_config_select,
           supervisor_map_1,
           supervisor_map_2,
           table_ram_addr_bus,
           table_ram_data_bus,
           addr_out);
endmodule
