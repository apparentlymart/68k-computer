module memmap_tb;
   `include "tap.vh"

   reg [(18*8)-1:0] test_name = 'bz;
   reg          enable = 'bz;
   reg          clk = 'bz;
   reg [27:20]  addr_in = 'bzzzzzzzz;
   wire         csunmap;
   wire         csram1;
   wire         csram2;
   wire         csrom;
   wire         csio;
   wire         csgfx;
   wire         csctrl;
   wire         cspgtbl;

   wire [7:0]   cs_mask = {
       csctrl,
       csgfx,
       csio,
       cspgtbl,
       csram1,
       csram2,
       csrom,
       csunmap
   };

   memmap dut(enable,
              clk,
              addr_in,
              csunmap,
              csram1,
              csram2,
              csrom,
              csio,
              csgfx,
              csctrl,
              cspgtbl);

   task reset;
       begin
           enable <= 'bz;
           addr_in <= 'bz;
           clk <= 'bz;
       end
   endtask

   task write_addr;
       input [27:20] test_addr_in;
       begin
           clk <= 'b0;
           addr_in <= test_addr_in;
           #1;
           clk <= 'b1;
       end
   endtask

   task assert_map_result;
      input [27:20] test_addr_in;
      input [7:0]   expected_mask;
      begin
         enable <= 0;
         write_addr(test_addr_in);
         #1;
         ok(cs_mask == 0'b00000000);
         $display("%s : Everything is low before enable", test_name);
         #1 enable <= 1;
         #1;
         ok(expected_mask == cs_mask);
         $display("%s : %x activates %x",
                  test_name, test_addr_in, expected_mask);
         if (expected_mask != cs_mask) begin
            $display("# expected %x, but got %x",
                     expected_mask, cs_mask);
         end
         #1 enable <= 0;
         #1;
      end
   endtask

   initial begin
      $dumpfile("memmap_tb.vcd");
      $dumpvars;
      $display("1..1");

      #1 test_name <= "Unmapped Memory   ";
      assert_map_result('h00, 8'b00000001);
      #1 test_name <= 'bz;
      reset;

      #1 test_name <= "Board Control Regs";
      assert_map_result('h01, 8'b10000000);
      #1 test_name <= 'bz;
      reset;

      #1 test_name <= "User Mode Page Tbl";
      assert_map_result('h02, 8'b00010000);
      #1 test_name <= 'bz;
      reset;

      #1 test_name <= "Primary I/O Ports ";
      assert_map_result('h03, 8'b00100000);
      #1 test_name <= 'bz;
      reset;

      #1 test_name <= "Undefined Memory  ";
      assert_map_result('h04, 8'b00000000);
      assert_map_result('h05, 8'b00000000);
      assert_map_result('h06, 8'b00000000);
      assert_map_result('h39, 8'b00000000);
      assert_map_result('h3a, 8'b00000000);
      assert_map_result('h3b, 8'b00000000);
      #1 test_name <= 'bz;
      reset;

      #1 test_name <= "Display/Audio Ctrl";
      assert_map_result('h3c, 8'b01000000);
      assert_map_result('h3d, 8'b01000000);
      assert_map_result('h3e, 8'b01000000);
      assert_map_result('h3f, 8'b01000000);
      #1 test_name <= 'bz;
      reset;

      #1 test_name <= "Main ROM          ";
      assert_map_result('h40, 8'b00000010);
      assert_map_result('h41, 8'b00000010);
      assert_map_result('h42, 8'b00000010);
      assert_map_result('h7d, 8'b00000010);
      assert_map_result('h7e, 8'b00000010);
      assert_map_result('h7f, 8'b00000010);
      #1 test_name <= 'bz;
      reset;

       #1 test_name <= "Main RAM          ";
      assert_map_result('h80, 8'b00001000);
      assert_map_result('h81, 8'b00001000);
      assert_map_result('hbe, 8'b00001000);
      assert_map_result('hbf, 8'b00001000);
      assert_map_result('hc0, 8'b00000100);
      assert_map_result('hc1, 8'b00000100);
      assert_map_result('hfe, 8'b00000100);
      assert_map_result('hff, 8'b00000100);
      #1 test_name <= 'bz;
      reset;


   end

endmodule
