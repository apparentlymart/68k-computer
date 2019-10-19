module video_pointer(
    input wire clk,
    input wire [3:0] x,
    input wire [3:0] y,
    input wire active,

    output reg [3:0] r,
    output reg [3:0] g,
    output reg [3:0] b,
    output reg opaque
);

    wire [15:0] pointer_r_data;
    wire [10:0] pointer_r_addr = (pointer_image * 16 * 16) + (y * 16) + x;
    wire        pointer_r_clk = clk;
    wire        pointer_r_clk_enable = 1'b1;
    wire        pointer_r_enable = 1'b1;
    wire [15:0] pointer_w_data;
    wire [10:0] pointer_w_addr;
    wire        pointer_w_clk;
    wire        pointer_w_clk_enable;
    wire        pointer_w_enable;

    wire  [1:0] pointer_color_idx = {pointer_r_data[13], pointer_r_data[11]};
    reg  [11:0] pointer_palette[2:0];
    reg   [2:0] pointer_image = 0;

    initial begin
        pointer_palette[0] = 12'h000;
        pointer_palette[1] = 12'hfff;
        pointer_palette[2] = 12'hf00;
        r = 0;
        g = 0;
        b = 0;
        opaque = 0;
    end

    always @(posedge clk) begin

        if (active) begin
            /*
            r <= pointer_color_idx << 2;
            g <= pointer_color_idx << 2;
            b <= pointer_color_idx << 2;
            opaque <= 1'b1;
            */
            ///*
            if (pointer_color_idx == 2'b0) begin
                r <= 4'hf;
                g <= 4'h0;
                b <= 4'hf;
                opaque <= 1'b0;
            end else begin
                r <= pointer_palette[pointer_color_idx-1][11:8];
                g <= pointer_palette[pointer_color_idx-1][7:4];
                b <= pointer_palette[pointer_color_idx-1][3:0];
                opaque <= 1'b1;
            end
            //*/
        end else begin
            r <= 4'b0000;
            g <= 4'b0000;
            b <= 4'b0000;
            opaque <= 1'b0;
        end
    end

    SB_RAM40_4K #(
        // This initialization data is generated by sprites/spritedata.go
        // from sprite image files in that directory.
        .INIT_0(256'b0000000011111010000001001111111000000000111110100000010011111110000000001111101000000100111111100000000011111010000001001111111000000100000001000000010000000000000000000000010000000000000000000000010000000100000001000000000000000001000001000000000100000000),
        .INIT_1(256'b0000000011111110000001001111101000000000111111100000010011111010000000001111111000000100111110100000000011111110000001001111101000000000000000000000000000000100000001000000000000000100000001000000000100000000000000010000010000000101000000010000010000000101),
        .INIT_2(256'b0000010011111010000000001111111000000100111110100000000011111110000001001111101000000000111111100000010011111010000000001111111000000100000001000000010000000000000000010000010000000001000000000000010100000101000001010000000100000000000001010000000000000000),
        .INIT_3(256'b0000010011111110000000001111101000000100111111100000000011111010000001001111111000000000111110100000010011111110000000001111101000000001000000000000000100000100000001010000000100000101000001010000000100000001000000010000010100000100000000010000010000000100),
        .INIT_4(256'b0000000011111010000001001111111000000000111110100000010011111110000000001111101000000100111111100000000111111010000001011111111000000101000001010000010100000001000000010000010100000001000000010000010100000101000001000000000100000000000001000000000000000000),
        .INIT_5(256'b0000000011111110000001001111101000000000111111100000010011111010000000001111111000000100111110100000000111111111000001011111101100000001000000010000000100000101000001010000000100000101000001010000000100000001000000000000010100000100000000000000010000000100),
        .INIT_6(256'b0000010011111010000000001111111000000100111110100000000011111110000001001111101000000000111111100000010011111010000000001111111000000101000001000000010100000001000000010000010100000001000000010000010000000101000001000000000000000000000001000000000000000000),
        .INIT_7(256'b0000010011111110000000001111101000000100111111100000000011111010000001001111111000000000111110100000010011111110000000011111101000000101000001010000000000000101000001010000000100000101000001010000000000000001000000000000010000000100000000000000010000000100),
        .INIT_8(256'b1111111011111110111111101111101011111010111111101111101011111010111111101111111011111110111110101111101111111110111110111111101111111010000000011111111000000100111110110000000111111110000001011111101000000000111111100000010011111010000000001111111000000100),
        .INIT_9(256'b1111101011111010111110101111111011111110111110101111111011111110111110101111101011111011111111101111111111111011111111101111111111111010000001001111111000000000111110110000010111111110000000011111101000000100111111100000000011111010000001001111111000000000),
        .INIT_A(256'b1111111011111110111111101111101011111010111111101111101011111010111111101111111011111111111110111111101011111111111110101111101011111110000000001111101000000100111111100000000011111010000001001111111000000000111110100000010011111110000000001111101000000100),
        .INIT_B(256'b1111101011111010111110101111111011111110111110101111111011111110111110101111101011111010111111101111111011111010111111101111111011111110000001001111101000000000111111100000010011111010000000001111111000000100111110100000000011111110000001001111101000000000),
        .INIT_C(256'b1111111011111110111111101111101011111010111111101111101011111010111111101111111011111110111110101111101011111110111110101111101011111010000000001111111000000100111110100000000011111110000001001111101000000000111111100000010011111010000000001111111000000100),
        .INIT_D(256'b1111101011111010111110101111111011111110111110101111111011111110111110101111101011111010111111101111111011111010111111101111111011111010000001001111111000000000111110100000010011111110000000001111101000000100111111100000000011111010000001001111111000000000),
        .INIT_E(256'b1111111011111110111111101111101011111010111111101111101011111010111111101111111011111110111110101111101011111110111110101111101011111110000000001111101000000100111111100000000011111010000001001111111000000000111110100000010011111110000000001111101000000100),
        .INIT_F(256'b1111101011111010111110101111111011111110111110101111111011111110111110101111101011111010111111101111111011111010111111101111111011111110000001001111101000000000111111100000010011111010000000001111111000000100111110100000000011111110000001001111101000000000),
        .READ_MODE(2'd3),
        .WRITE_MODE(2'd3)
    ) pointer_ram (
        .RDATA(pointer_r_data),
        .RADDR(pointer_r_addr),
        .RCLK(pointer_r_clk),
        .RCLKE(pointer_r_clk_enable),
        .RE(pointer_r_enable) //,
        //.WDATA(pointer_w_data), 
        //.WADDR(pointer_w_addr),
        //.WCLK(pointer_w_clk),
        //.WCLKE(pointer_w_clk_enable),
        //.WE(pointer_w_enable)
    );

endmodule