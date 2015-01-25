`define ASSERT(cond, msg) ok(cond); $display(msg)

module mmu_tb;

   reg [24*8:0] test_name = 'bz;
   reg          enable = 0;
   reg [23:12]  addr_in = 0;
   reg [2:0]    fc = 0;
   reg [3:0]    user_map = 0;
   reg [7:0]    supervisor_map_1 = 0;
   reg [7:0]    supervisor_map_2 = 0;
   wire [15:0]  table_ram_addr_bus;
   reg [15:0]   table_ram_data_bus = 0;
   wire [27:12] addr_out;

   mmu dut(enable,
           addr_in,
           fc,
           user_map,
           supervisor_map_1,
           supervisor_map_2,
           table_ram_addr_bus,
           table_ram_data_bus,
           addr_out);

   task ok;
      input ok;
      begin
         if (ok)
           $write("ok - ");
         else
           $write("not ok - ");
      end
   endtask

   task reset;
      begin
         enable <= 'bz;
         addr_in <= 'bz;
         fc <= 'bz;
         user_map <= 'bz;
         supervisor_map_1 <= 'bz;
         supervisor_map_2 <= 'bz;
         table_ram_data_bus <= 'bz;
      end
   endtask

   task assert_user_mode_data_bus;
      begin
         #1;
         addr_in <= 0;
         fc <= 3'b001;
         table_ram_data_bus <= 2;
         #1 enable <= 1;
         #1;
         `ASSERT(addr_out == 2,
                 "addr_out reflects RAM data bus in user mode");
         #1 enable <= 0;
         table_ram_data_bus <= 'bz;
         #1;
      end
   endtask

   task assert_user_mode_lookup;
      input [23:12] test_addr_in;
      input [3:0]   test_user_map;
      input [15:0]  expected_ram_addr_bus;
      begin
         #1;
         addr_in <= test_addr_in;
         user_map <= test_user_map;
         fc <= 3'b001;
         #1 enable <= 1;
         #1;
         ok(expected_ram_addr_bus == table_ram_addr_bus);
         $display("%xxxx in user task %x looks up %x in page table",
                  test_addr_in, test_user_map, expected_ram_addr_bus);
         if (expected_ram_addr_bus != table_ram_addr_bus) begin
            $display("# expected %x, but got %x",
                     expected_ram_addr_bus, table_ram_addr_bus);
         end
         #1 enable <= 0;
         #1;
      end
   endtask

   task assert_super_mode_lookup;
      input [23:12] test_addr_in;
      input [7:0]   test_supervisor_map_1;
      input [7:0]   test_supervisor_map_2;
      input [27:12] expected_addr_out;
      begin
         #1;
         addr_in <= test_addr_in;
         supervisor_map_1 <= test_supervisor_map_1;
         supervisor_map_2 <= test_supervisor_map_2;
         fc <= 3'b101;
         #1 enable <= 1;
         #1;
         ok(expected_addr_out == addr_out);
         $display("%xxxx in supervisor maps to %xxxx in physical space",
                  test_addr_in, expected_addr_out);
         if (expected_addr_out != addr_out)
             $display("# expected %xxxx, but got %xxxx",
                      expected_addr_out, addr_out);
         #1 enable <= 0;
         #1;
      end
   endtask

   initial begin
      $dumpfile("mmu_tb.vcd");
      $dumpvars;
      $display("1..14");

      #1 test_name <= "User Mode Data Bus";
      assert_user_mode_data_bus;
      #1 test_name <= 'bz;
      reset;

      #1 test_name <= "User Mode Page Lookup";
      // Since the user mode mappings delegate to an external RAM
      // that isn't included in this test, we instead just probe
      // the address bus that would be connected to that RAM.
      assert_user_mode_lookup(0, 0, 0);
      assert_user_mode_lookup(0, 1, 'h1000);
      assert_user_mode_lookup(2, 0, 'h0002);
      assert_user_mode_lookup(2, 1, 'h1002);
      assert_user_mode_lookup(2, 4, 'h4002);
      #1 test_name <= 'bz;
      reset;

      // Kernel RAM maps to first portion of RAM
      #1 test_name <= "Supervisor Mode - RAM";
      assert_super_mode_lookup('h000, 0, 0, 'h8000);
      assert_super_mode_lookup('h001, 0, 0, 'h8001);
      assert_super_mode_lookup('h3fe, 0, 0, 'h83fe);
      assert_super_mode_lookup('h3ff, 0, 0, 'h83ff);
      // Kernel ROM maps to first portion of ROM
      #1 test_name <= "Supervisor Mode - ROM";
      assert_super_mode_lookup('h400, 0, 0, 'h4000);
      assert_super_mode_lookup('h401, 0, 0, 'h4001);
      assert_super_mode_lookup('h7fe, 0, 0, 'h43fe);
      assert_super_mode_lookup('h7ff, 0, 0, 'h43ff);
      #1 test_name <= 'bz;
      reset;

   end

endmodule
