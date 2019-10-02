module video_test_pattern
(
    input wire clk,
    input wire [15:0] x,
    input wire [15:0] y,
    input wire visible,

    output reg [3:0] r,
    output reg [3:0] g,
    output reg [3:0] b
);

    always @(posedge clk) begin
        r <= 4'b0000;
        g <= 4'b0000;
        b <= 4'b0000;

        if (visible) begin
            if (y < 100) begin
                r <= x[5:2];
            end else if (y < 200) begin
                g <= x[5:2];
            end else if (y < 300) begin
                b <= x[5:2];
            end else if (y < 400) begin
                r <= x[5:2];
                g <= x[5:2];
            end else if (y < 500) begin
                r <= x[5:2];
                b <= x[5:2];
            end else if (y < 600) begin
                g <= x[5:2];
                b <= x[5:2];
            end else if (y < 700) begin
                r <= x[5:2];
                g <= x[5:2];
                b <= x[5:2];
            end else begin
                if (x[7:0] < 64) begin
                    r <= x[3:0];
                end else if (x[7:0] < 128) begin
                    g <= x[3:0];
                end else if (x[7:0] < 192) begin
                    b <= x[3:0];
                end else begin
                    r <= x[3:0];
                    g <= x[3:0];
                    b <= x[3:0];
                end
            end
        end
    end

endmodule
