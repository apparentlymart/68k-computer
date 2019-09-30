module video_timing_tb();

    reg clk;
    reg rst;
    wire [15:0] x;
    wire [15:0] y;
    wire hsync;
    wire vsync;
    wire visible;

    video_timing dut(
        .clk(clk),
        .reset(rst),
        .x(x),
        .y(y),
        .hsync(hsync),
        .vsync(vsync),
        .visible(visible)
    );

    initial begin
        $dumpfile(`DUMP_FILENAME);
        $dumpvars;

        clk = 0;
        rst = 1;
        #2
        rst = 0;
        #4950000 // enough for at least one whole frame
        $finish;
    end

    always begin
        #1  clk = ~clk; 
    end

endmodule
