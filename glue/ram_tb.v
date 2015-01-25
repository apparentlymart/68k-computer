module ram_tb;

   reg [7:0]  addr;
   wire [7:0] data;
   reg        write;
   reg        enable;

   reg [7:0]  data_to_write;
   reg        enable_data_to_write;

   assign data = enable_data_to_write ? data_to_write : 'bz;

   ram #(8, 8) dut(addr, data, enable, write);

   task pulse_enable;
      begin
         #1 enable <= 1;
         #1 enable <= 0;
         #1;
      end
   endtask

   task assert_data;
      input [7:0] test_addr;
      input [7:0] expected;
      begin
         #1 addr <= test_addr;
         #1 enable <= 1;
         #1 if (data == expected)
           $display("ok - data at %x is %x", test_addr, expected);
         else
           $display("not ok - data at %x is %x", test_addr, expected);
         #1 enable <= 0;
         #1;
      end
   endtask

   initial begin
      $dumpfile("ram_tb.vcd");
      $dumpvars;
      $display("1..2");

      addr <= 0;
      enable_data_to_write <= 0;
      write <= 0;
      enable <= 0;

      #1 addr <= 1;
      data_to_write <= 128;
      enable_data_to_write <= 1;
      write <= 1;
      pulse_enable;

      #1 addr <= 2;
      data_to_write <= 129;
      pulse_enable;

      #1 write <= 0;
      enable_data_to_write <= 0;

      assert_data(1, 128);
      assert_data(2, 129);

      $finish;
   end

endmodule
