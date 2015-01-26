module ft800_interface_tb;
   `include "tap.vh"

   reg         rst = 0;
   reg         clk = 0;
   reg [21:1]  addr = 0;
   reg [15:0]  data_src = 0;
   reg         assert_data = 0;
   wire [15:0] data;

   reg         write;
   reg         command;
   reg         enable;

   wire        complete;

   wire        mosi;
   wire        miso;
   wire        chip_select;
   wire        spi_clk;

   reg [47:0]  mosi_log;
   reg [7:0]   mosi_log_bits;
   reg         alt = 0;

   assign data = assert_data ? data_src : 'bz;
   assign miso = alt;

   ft800_interface dut(rst,
                       clk,
                       addr,
                       data,
                       write,
                       command,
                       enable,
                       complete,
                       mosi,
                       miso,
                       chip_select,
                       spi_clk);

   task collect_mosi;
      begin
         #1;
         mosi_log <= 0;
         #1;
         for (mosi_log_bits = 0; chip_select; mosi_log_bits = mosi_log_bits) begin
            @(posedge spi_clk or negedge chip_select);
            if (chip_select) begin
              mosi_log <= {mosi_log[38:0], mosi};
              mosi_log_bits <= mosi_log_bits + 1;
              @(negedge spi_clk or negedge chip_select);
            end
         end
         #1;
      end
   endtask

   task test_read;
      input [21:1] test_addr;
      input [7:0] expected_mosi_bits;
      input [47:0] expected_mosi_log;
      begin
         #1;
         addr <= test_addr;
         write <= 0;
         command <= 0;
         assert_data <= 0;
         #1 enable <= 1;
         collect_mosi;
         #1 enable <= 0;
         #1;
         ok(expected_mosi_bits == mosi_log_bits);
         $display("read from %x produced %1d bits", test_addr, expected_mosi_bits);
         if(expected_mosi_bits == mosi_log_bits) begin
            ok(expected_mosi_log == mosi_log);
            $display("read from %x produced expected bits", test_addr);
            if (expected_mosi_log != mosi_log)
              $display("# expected %b", expected_mosi_log);
              $display("#      got %b", mosi_log);
         end else begin
            $display("# actually produced %1d bits", mosi_log_bits);
            $display("ok - read from %x produced expected bits # SKIP unexpected number of bits", test_addr);
         end

         #1;
      end
   endtask

   initial begin
      enable <= 0;
      write <= 0;
      command <= 0;
      rst <= 1;
      $dumpfile("ft800_interface_tb.vcd");
      $dumpvars;

      $display("1..2");

      #1 rst <= 0;

      #1 test_read('h17d557, 48, {2'b00, 22'h17d557, 8'h0, 16'h0});

      #10 $finish;
   end

   always #1 clk = ~clk;

   always @(posedge spi_clk) alt = ~alt;

endmodule
