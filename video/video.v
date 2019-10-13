`include "timing.v"
`include "testpattern.v"
`include "pointer.v"
`include "composite.v"

module top
(
  input  CLK,

  output LEDR_N, // Red LED on the ICEbreaker board
  output LEDG_N, // Green LED on the ICEbreaker board
  input BTN_N, // User button on the ICEbreaker board

  output P1A1, P1A2, P1A3, P1A4, P1A7, P1A8, P1A9, P1A10,
  output P1B1, P1B2, P1B3, P1B4, P1B7, P1B8, P1B9, P1B10
);

    wire          reset_loc;
    wire          clk_40m_tree;
    wire          vga_de;
    reg           vga_ck;
    wire          vga_hs;
    wire          vga_vs;
    wire [23:0]   vga_rgb;
    wire [3:0]    r;
    wire [3:0]    g;
    wire [3:0]    b;
    reg           mode_bit;
    wire [15:0]   x;
    wire [15:0]   y;

    assign reset_loc  = ~BTN_N;

    assign {P1A1, P1A2, P1A3, P1A4, P1A7, P1A8, P1A9, P1A10} =
           {r[3], r[1], g[3], g[1], r[2], r[0], g[2], g[0]};
    assign {P1B1, P1B2,   P1B3, P1B4,   P1B7, P1B8, P1B9,   P1B10} =
           {b[3], vga_ck, b[0], vga_hs, b[2], b[1], vga_de, vga_vs};

    // PLL to generate our pixel clock
    // We actually generate a clock twice as fast as our required pixel
    // clock, which we can use for other operations that need to be faster
    // than pixel emission, and then divide it by two below to produce
    // the pixel clock.
    //
    // F_OUT = (F_REF * (DIVF + 1)) / (2^DIVQ) * (DIVR+1)
    // -------------
    // F_REF = 12MHz (the "FTDI_CLK" signal on the ICEbreaker board)
    // DIVF = 48
    // DIVQ = 2
    // DIVR = 0
    // -------------
    // (12 MHz * (48 + 1)) / ((2 ^ 2) * (0 + 1)) = 147MHz
    // 147MHz / 2 = 73.5MHz
    // 720p wants 74.25MHz, but 73.5MHz is as close as we can get with our
    // input frequency and the constraints of the PLL.
    SB_PLL40_PAD #(
        .DIVF(7'd48),
        .DIVQ(3'd2),
        .DIVR(4'd0),
        .FILTER_RANGE(3'b001),
        .FEEDBACK_PATH("SIMPLE"),
        .DELAY_ADJUSTMENT_MODE_FEEDBACK("FIXED"),
        .FDA_FEEDBACK(4'b0000),
        .DELAY_ADJUSTMENT_MODE_RELATIVE("FIXED"),
        .FDA_RELATIVE(4'b0000),
        .SHIFTREG_DIV_MODE(2'b00),
        //.PLLOUT_SELECT("GENCLK"),
        .ENABLE_ICEGATE(1'b0)
    ) pixel_clock (
        .PACKAGEPIN(CLK),
        .PLLOUTCORE(clk_40m_tree),
        .EXTFEEDBACK(),
        .RESETB(1'b1),
        .BYPASS(1'b0),
        .LATCHINPUTVALUE()
    );

    // vga_ck is clk_40m_tree divided by two
    always @(posedge clk_40m_tree) begin
        if (reset_loc) begin
            vga_ck <= 1'b0;
        end else begin
            vga_ck <= ~vga_ck;
        end
    end

    video_timing timing(
        .reset(reset_loc),
        .clk(vga_ck),
        .hsync(vga_hs),
        .vsync(vga_vs),
        .visible(vga_de),
        .x(x),
        .y(y)
    );

    /*
    video_test_pattern pattern(
        .clk(vga_ck),
        .visible(vga_de),
        .x(x),
        .y(y),
        .r(r),
        .g(g),
        .b(b)
    );
    */

    wire [4:0] pointer_x;
    wire [4:0] pointer_y;
    wire       pointer_active;
    wire [3:0] pointer_r;
    wire [3:0] pointer_g;
    wire [3:0] pointer_b;
    wire       pointer_opaque;

    video_composite composite(
        .clk(vga_ck),
        .visible(vga_de),
        .x(x),
        .y(y),
        .r(r),
        .g(g),
        .b(b),

        .pointer_x(pointer_x),
        .pointer_y(pointer_y),
        .pointer_active(pointer_active),

        .pointer_r(pointer_r),
        .pointer_g(pointer_g),
        .pointer_b(pointer_b),
        .pointer_opaque(pointer_opaque)
    );

    video_pointer pointer(
        .clk(vga_ck),

        .x(pointer_x),
        .y(pointer_y),
        .active(pointer_active),

        .r(pointer_r),
        .g(pointer_g),
        .b(pointer_b),
        .opaque(pointer_opaque)
    );

endmodule
