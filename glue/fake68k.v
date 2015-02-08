/*
 This module is able to fake the read and write cycles of a 68000-series
 microcontroller. It is intended only for use in testbenches for our other
 modules that attempt to communicate with a 68000.

 It's not intended to be synthesizable; it's just for simulation.
 */
module fake68k
   (
      // Controls for use in test benches.
      input         clk,
      input [2:0]   cycle_type,
      input [23:0]  mock_addr,
      input [15:0]  mock_data_to_write,
      input [2:0]   mock_fc,
      output [15:0] data_read,
      output [4:0]  mock_state,

      // Simulated 68k device pins to attach to the DUT.
      input         dtack_n,
      input         berr_n,
      output [2:0]  fc,
      output        read,
      output [23:0] addr,
      inout [15:0]  data,
      output        as_n,
      output        uds_n,
      output        lds_n
   );

   localparam IDLE = 0;
   localparam READ_CYCLE = 1;
   localparam WRITE_CYCLE = 2;
   localparam READ_WRITE_CYCLE = 3;

   wire             dtack = ~dtack_n;
   wire             berr = ~berr_n;

   reg [4:0]        current_state = 0;
   reg [4:0]        next_state = 0;
   reg [15:0]       data_read_reg = 0;

   reg              drive_addr = 0;
   reg              drive_data = 0;
   reg              as = 0;
   reg              uds = 0;
   reg              lds = 0;
   reg              write = 0;

   assign data_read = data_read_reg;
   assign addr = drive_addr ? mock_addr : 'bz;
   assign data = drive_data ? mock_data_to_write : 'bz;
   assign as_n = ~as;
   assign uds_n = ~uds;
   assign lds_n = ~lds;
   assign read = ~write;
   assign fc = cycle_type != 0 ? mock_fc : 'bz;

   assign mock_state = cycle_type != 0 ? current_state : 'bz;

   always @(clk) begin
      current_state <= cycle_type != 0 ? next_state : 0;
   end

   always @(*) begin
      next_state <= current_state;
      if (cycle_type == READ_CYCLE)
        case (current_state)
          0: begin
             if (cycle_type != 0 && clk == 1)
               next_state <= 1;
          end
          1: next_state <= 2;
          2: next_state <= 3;
          3: next_state <= 4;
          4: begin
             // Only transition to state 5 once dtack is asserted, and then
             // only on a falling edge so that state 5 is always a low-clock
             // cycle.
             if ((dtack == 1 || berr == 1) && clk == 1)
               next_state <= 5;
          end
          5: next_state <= 6;
          6: next_state <= 7;
          7: begin
             if (berr)
               next_state <= 8;
             else
               next_state <= 0;
          end
          // The remaining states are used only in the Bus Error case.
          8: next_state <= 9;
          // We need to hold in this position until we make a positive clock
          // edge with BERR unasserted, so we use a fictitious state 10 to
          // represent the wait states that might result.
          9: begin
             if (berr)
               next_state <= 10;
             else
               next_state <= 0;
          end
          10: begin
             // Transition back to zero only if the next clock will be
             // a positive edge, to make sure that S0 remains a high clock
             // state.
             if (clk == 0 && ~berr)
               next_state <= 0;
          end
        endcase
   end

   always @(current_state) begin
      // Some defaults to make sure we'll always reset these to *something*
      // predictable.
      drive_addr <= 0;
      drive_data <= 0;
      as <= 0;
      uds <= 0;
      lds <= 0;
      write <= 0;
      if (cycle_type == READ_CYCLE)
        case (current_state)
          1: begin
             drive_addr <= 1;

             // Reset data_read_reg just in case it was left populated
             // by a previous cycle.
             data_read_reg <= 0;
          end
          2: begin
             drive_addr <= 1;
             as <= 1;
             uds <= 1;
             lds <= 1;
          end
          3: begin
             drive_addr <= 1;
             as <= 1;
             uds <= 1;
             lds <= 1;
          end
          4: begin
             drive_addr <= 1;
             as <= 1;
             uds <= 1;
             lds <= 1;
          end
          5: begin
             drive_addr <= 1;
             as <= 1;
             uds <= 1;
             lds <= 1;
          end
          6: begin
             drive_addr <= 1;
             as <= 1;
             uds <= 1;
             lds <= 1;
          end
          7: begin
             drive_addr <= 1;

             // We must latch the data as we enter S7.
             if (berr) begin
                as <= 1;
                uds <= 1;
                lds <= 1;
             end else
               data_read_reg <= data;
          end
          8: begin
             drive_addr <= 1;
             as <= 1;
             uds <= 1;
             lds <= 1;
          end
          9: begin
             drive_addr <= 1;
             as <= 1;
             uds <= 1;
             lds <= 1;
          end
        endcase
   end

endmodule