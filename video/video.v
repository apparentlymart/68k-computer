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
    wire          vga_ck;
    wire          vga_hs;
    wire          vga_vs;
    wire [23:0]   vga_rgb;
    wire [7:0]    r;
    wire [7:0]    g;
    wire [7:0]    b;
    reg           mode_bit;

    assign reset_loc  = ~BTN_N;

    assign {P1A1, P1A2, P1A3, P1A4, P1A7, P1A8, P1A9, P1A10} =
           {r[7], r[5], g[7], g[5], r[6], r[4], g[6], g[4]};
    assign {P1B1, P1B2,   P1B3, P1B4,   P1B7, P1B8, P1B9,   P1B10} =
           {b[7], vga_ck, b[4], vga_hs, b[6], b[5], vga_de, vga_vs};

    assign vga_ck = clk_40m_tree;

    // PLL to generate our pixel clock
    //
    // F_OUT = (F_REF * (DIVF + 1)) / (2^DIVQ) * (DIVR+1)
    // -------------
    // F_REF = 12MHz (the "FTDI_CLK" signal on the ICEbreaker board)
    // DIVF = 98
    // DIVQ = 4
    // DIVR = 0
    // -------------
    // (12MHz * (98 + 1)) / (2^4) * (0+1) = 74.25MHz, for 720p
    SB_PLL40_PAD #(
        .DIVR(4'b0000),
        .DIVF(7'd98),
        .DIVQ(3'b100),
        .FILTER_RANGE(3'b001),
        .FEEDBACK_PATH("SIMPLE"),
        .DELAY_ADJUSTMENT_MODE_FEEDBACK("FIXED"),
        .FDA_FEEDBACK(4'b0000),
        .DELAY_ADJUSTMENT_MODE_RELATIVE("FIXED"),
        .FDA_RELATIVE(4'b0000),
        .SHIFTREG_DIV_MODE(2'b00),
        .PLLOUT_SELECT("GENCLK"),
        .ENABLE_ICEGATE(1'b0)
    ) usb_pll_inst (
        .PACKAGEPIN(CLK),
        .PLLOUTCORE(clk_40m_tree),
        //.PLLOUTGLOBAL(),
        .EXTFEEDBACK(),
        .DYNAMICDELAY(),
        .RESETB(1'b1),
        .BYPASS(1'b0),
        .LATCHINPUTVALUE(),
        //.LOCK(),
        //.SDI(),
        //.SDO(),
        //.SCLK()
    );

endmodule
