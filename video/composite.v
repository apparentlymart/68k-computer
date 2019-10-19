module video_composite
(
    input wire clk,
    input wire [15:0] x,
    input wire [15:0] y,
    input wire visible,
    output reg [3:0] r,
    output reg [3:0] g,
    output reg [3:0] b,

    input wire [3:0] pointer_r,
    input wire [3:0] pointer_g,
    input wire [3:0] pointer_b,
    input wire pointer_opaque,
    output reg [4:0] pointer_x,
    output reg [4:0] pointer_y,
    output reg pointer_active
);

    initial begin
        pointer_x = 0;
        pointer_y = 0;
        pointer_active = 0;
    end

    always @(posedge clk) begin
        r <= 4'd0;
        g <= 4'd0;
        b <= 4'd0;

        if (visible) begin
            pointer_active <= 1'b1;
            pointer_x <= x[3:0];
            pointer_y <= y[3:0];

            if (pointer_opaque) begin
                r <= pointer_r;
                g <= pointer_g;
                b <= pointer_b;
            end
        end
    end

endmodule
