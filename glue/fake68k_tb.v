module fake68k_tb;
   `include "tap.vh"

   reg [(18*8)-1:0] test_name = 'bz;
   reg         clk = 0;
   reg [2:0]   cycle_type = 0;
   reg [23:0]  mock_addr = 0;
   reg [15:0]  mock_data_to_write = 0;
   reg [2:0]   mock_fc = 0;
   wire [15:0] data_read;
   wire [4:0]  mock_state;
   reg         dtack_n = 1;
   reg         berr_n = 1;
   wire [2:0]  fc;
   wire        read;
   wire [23:0] addr;
   wire [15:0] data;
   wire        as_n;
   wire        uds_n;
   wire        lds_n;

   reg [15:0]  mock_data_to_read = 0;
   reg         drive_data_bus = 0;
   assign data = drive_data_bus ? mock_data_to_read : 'bz;

   fake68k dut(clk,
               cycle_type,
               mock_addr,
               mock_data_to_write,
               mock_fc,
               data_read,
               mock_state,
               dtack_n,
               berr_n,
               fc,
               read,
               addr,
               data,
               as_n,
               uds_n,
               lds_n);

   task test_initial_state;
      begin
         #1 test_name <= "Initial State     ";
         #2;
         ok(as_n); $display("AS unasserted when idle");
         ok(uds_n); $display("UDS unasserted when idle");
         ok(lds_n); $display("LDS unasserted when idle");
         ok(fc === 3'bz); $display("FCn Z when idle");
         ok(addr === 24'bz); $display("ADDRn Z when idle");
         ok(data === 16'bz); $display("DATAn Z when idle");
         #1 test_name <= 'bz;
      end
   endtask

   task test_read_cycle;
      begin
         #1 test_name <= "Read Cycle        ";

         // Make sure cycle zero will always start on a positive edge,
         // by trying to trick the fake68k into starting it on a negative.
         @(negedge clk);
         cycle_type = 1; // READ_CYCLE
         mock_fc = 'b011;
         mock_addr = 120;
         dtack_n = 1;
         berr_n = 1;
         mock_data_to_read = 'h7f7f;
         drive_data_bus = 0;

         #1;
         ok(fc === 'b011); $display("FCn driven when active");
         ok(mock_state === 0); $display("State is still zero before posedge clk");
         ok(as_n); $display("AS unasserted in state pre-0");
         ok(uds_n); $display("UDS unasserted in state pre-0");
         ok(lds_n); $display("LDS unasserted in state pre-0");
         ok(addr === 24'bz); $display("ADDRn Z in state pre-0");
         ok(data === 16'bz); $display("DATAn Z in state pre-0");

         #1;
         ok(mock_state === 0); $display("State is still zero after posedge clk");
         ok(fc === 'b011); $display("FCn driven in state 0");
         ok(as_n); $display("AS unasserted in state 0");
         ok(uds_n); $display("UDS unasserted in state 0");
         ok(lds_n); $display("LDS unasserted in state 0");
         ok(addr === 24'bz); $display("ADDRn Z in state 0");
         ok(data === 16'bz); $display("DATAn Z in state 0");

         #1;
         ok(mock_state === 1); $display("State transitions to 1");
         ok(fc === 'b011); $display("FCn driven in state 1");
         ok(as_n); $display("AS unasserted in state 1");
         ok(uds_n); $display("UDS unasserted in state 1");
         ok(lds_n); $display("LDS unasserted in state 1");
         ok(addr == 120); $display("ADDRn driven in state 1");
         ok(data === 16'bz); $display("DATAn Z in state 1");

         #1;
         ok(mock_state === 2); $display("State transitions to 2");
         ok(fc === 'b011); $display("FCn driven in state 2");
         ok(~as_n); $display("AS asserted in state 2");
         ok(~uds_n); $display("UDS asserted in state 2");
         ok(~lds_n); $display("LDS asserted in state 2");
         ok(addr == 120); $display("ADDRn driven in state 2");
         ok(data === 16'bz); $display("DATAn Z in state 2");

         #1;
         ok(mock_state === 3); $display("State transitions to 3");
         ok(fc === 'b011); $display("FCn driven in state 3");
         ok(~as_n); $display("AS asserted in state 3");
         ok(~uds_n); $display("UDS asserted in state 3");
         ok(~lds_n); $display("LDS asserted in state 3");
         ok(addr == 120); $display("ADDRn driven in state 3");
         ok(data === 16'bz); $display("DATAn Z in state 3");

         #1;
         ok(mock_state === 4); $display("State transitions to 4");
         ok(fc === 'b011); $display("FCn driven in state 4");
         ok(~as_n); $display("AS asserted in state 4");
         ok(~uds_n); $display("UDS asserted in state 4");
         ok(~lds_n); $display("LDS asserted in state 4");
         ok(addr == 120); $display("ADDRn driven in state 4");
         ok(data === 16'bz); $display("DATAn Z in state 4");

         #1;
         ok(mock_state === 4); $display("Still state 4 because no DTACK");
         dtack_n = 0;
         drive_data_bus = 1;

         #1;
         ok(mock_state === 4); $display("Still state 4 because CLK is high");

         #1;
         ok(mock_state === 5); $display("State transitions to 5");
         ok(fc === 'b011); $display("FCn driven in state 5");
         ok(~as_n); $display("AS asserted in state 5");
         ok(~uds_n); $display("UDS asserted in state 5");
         ok(~lds_n); $display("LDS asserted in state 5");
         ok(addr == 120); $display("ADDRn driven in state 5");
         ok(data === 'h7f7f); $display("DATAn driven by us in state 5");

         #1;
         ok(mock_state === 6); $display("State transitions to 6");
         ok(fc === 'b011); $display("FCn driven in state 6");
         ok(~as_n); $display("AS asserted in state 6");
         ok(~uds_n); $display("UDS asserted in state 6");
         ok(~lds_n); $display("LDS asserted in state 6");
         ok(addr == 120); $display("ADDRn driven in state 6");
         ok(data === 'h7f7f); $display("DATAn driven by us in state 6");
         ok(data_read == 0); $display("Data hasn't been latched yet");

         #1;
         ok(mock_state === 7); $display("State transitions to 7");
         ok(fc === 'b011); $display("FCn driven in state 7");
         ok(as_n); $display("AS unasserted in state 7");
         ok(uds_n); $display("UDS unasserted in state 7");
         ok(lds_n); $display("LDS unasserted in state 7");
         ok(addr == 120); $display("ADDRn driven in state 6");
         ok(data === 'h7f7f); $display("DATAn driven by us in state 7");
         ok(data_read == 'h7f7f); $display("Data has now been latched");
         drive_data_bus = 0;
         dtack_n = 0;

         #1;
         ok(mock_state === 0); $display("State transitions back to 0");
         cycle_type = 0; // deactivate fake68k, resetting to intial state

         #1 test_name <= 'bz;
      end
   endtask

   task test_read_cycle_berr;
      begin
         #1 test_name <= "Read Cycle BERR   ";

         cycle_type = 1; // READ_CYCLE
         mock_fc = 'b011;
         mock_addr = 'hbeef;
         dtack_n = 1;
         berr_n = 1;
         mock_data_to_read = 'h7f7f;
         drive_data_bus = 0;

         // We tested the early states in test_read_cycle, so we just assume
         // they are working correctly for the sake of this test.
         #4;
         berr_n = 0;

         #1;
         ok(mock_state === 3); $display("State is 3");
         ok(addr == 'hbeef); $display("ADDRn remains asserted");
         ok(~as_n); $display("AS remains asserted");
         ok(~uds_n); $display("UDS remains asserted");
         ok(~lds_n); $display("LDS remains asserted");

         #5;
         ok(mock_state === 8); $display("State is 8");
         ok(addr == 'hbeef); $display("ADDRn remains asserted");
         ok(~as_n); $display("AS remains asserted");
         ok(~uds_n); $display("UDS remains asserted");
         ok(~lds_n); $display("LDS remains asserted");

         #2;
         ok(mock_state === 10); $display("State is virtual state 10");
         ok(addr === 24'bz); $display("ADDRn is Z");
         ok(as_n); $display("AS unasserted");
         ok(uds_n); $display("UDS unasserted");
         ok(lds_n); $display("LDS unasserted");
         berr_n = 1;

         #1;
         ok(mock_state === 10); $display("State is still 10 because we were on a high clock");

         #1;
         ok(mock_state === 0); $display("State returns to 0");
         cycle_type = 0; // deactivate fake68k, resetting to intial state

         #1 test_name <= 'bz;
      end
   endtask

   initial begin
      $dumpfile("fake68k_tb.vcd");
      $dumpvars;
      $display("1..91");

      test_initial_state();

      test_read_cycle();

      test_read_cycle_berr();

      $finish;
   end

   always #1 clk = ~clk;
endmodule
