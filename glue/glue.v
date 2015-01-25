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

   reg [3:0]      page_config_select;
   reg [7:0]      supervisor_map_1;
   reg [7:0]      supervisor_map_2;

   localparam     IDLE = 0,
                  DECODE = 1,
                  READ = 2,
                  WRITE = 3,
                  WAIT = 7;

   reg [2:0]      state_d, state_q;
   reg [3:0]      boot_counter;

   always @(clk) begin
      if (reset) begin
         state_q <= IDLE;
         boot_counter <= 2'b1000;
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
              boot_counter = boot_counter >> 1;
           end

           dtack = 1;

           state_d = IDLE;
        end

        WRITE: begin
           if (boot_counter != 0) begin
              boot_counter = boot_counter - 1;
           end

           if (rom_enable) begin
              berr = 1;
           end else begin
              dtack = 1;
           end

           state_d = WAIT;
        end

        WAIT: begin
           // Wait for AS to deassert before we return to idle,
           // signalling the end of the bus cycle.
           if (~as) begin
              state_d = IDLE;
           end
        end
      endcase
   end

endmodule
