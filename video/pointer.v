module video_pointer(
    input wire clk,
    input wire [4:0] x,
    input wire [4:0] y,
    input wire active,

    output reg [3:0] r,
    output reg [3:0] g,
    output reg [3:0] b,
    output reg opaque
);

    wire [15:0] pointer_r_data;
    wire [10:0] pointer_r_addr;
    wire        pointer_r_clk = clk;
    wire        pointer_r_clk_enable = 1'b1;
    wire        pointer_r_enable = 1'b1;
    wire [15:0] pointer_w_data;
    wire [10:0] pointer_w_addr;
    wire        pointer_w_clk;
    wire        pointer_w_clk_enable;
    wire        pointer_w_enable;

    wire  [1:0] pointer_color_idx = {pointer_r_data[11], pointer_r_data[13]};
    reg  [11:0] pointer_palette[2:0];

    initial begin
        pointer_palette[0] = 12'h000;
        pointer_palette[1] = 12'hf00;
        pointer_palette[2] = 12'hfff;
    end

    always @(posedge clk) begin

        if (active) begin
            if (pointer_color_idx == 2'b0) begin
                r <= 4'd0;
                g <= 4'd0;
                b <= 4'd0;
                opaque <= 1'b0;
            end else begin
                r <= pointer_palette[pointer_color_idx-1][11:8];
                g <= pointer_palette[pointer_color_idx-1][7:4];
                b <= pointer_palette[pointer_color_idx-1][3:0];
                opaque <= 1'b1;
            end
        end else begin
            r <= 4'bzzzz;
            g <= 4'bzzzz;
            b <= 4'bzzzz;
            opaque <= 1'bz;
        end
    end

    SB_RAM40_4K #(
        .READ_MODE(2'd3),
        .WRITE_MODE(2'd3),
        .INIT_0(256'b1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111)
    ) pointer_ram (
        .RDATA(pointer_r_data),
        .RADDR(pointer_r_addr),
        .RCLK(pointer_r_clk),
        .RCLKE(pointer_r_clk_enable),
        .RE(pointer_r_enable),
        .WDATA(pointer_w_data), 
        .WADDR(pointer_w_addr),
        .WCLK(pointer_w_clk),
        .WCLKE(pointer_w_clk_enable),
        .WE(pointer_w_enable)
    );

endmodule
