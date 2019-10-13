module video_timing
(
    input wire reset,
    input wire clk,

    output reg [15:0] x,
    output reg [15:0] y,
    output reg hsync,
    output reg vsync,
    output reg visible
);

    // State constants for our two timing state machines (one horizontal, one vertical)
    `define VIDEO_SYNC       2'd0
    `define VIDEO_BACKPORCH  2'd1
    `define VIDEO_ACTIVE     2'd2
    `define VIDEO_FRONTPORCH 2'd3

    // These settings are for 720p, assuming clk is running at 74.25 MHz
    `define VIDEO_H_SYNC_PIXELS   16'd40
    `define VIDEO_H_BP_PIXELS     16'd220
    `define VIDEO_H_ACTIVE_PIXELS 16'd1280
    `define VIDEO_H_FP_PIXELS     16'd110
    `define VIDEO_H_SYNC_ACTIVE   1'b1
    `define VIDEO_V_SYNC_LINES    16'd5
    `define VIDEO_V_BP_LINES      16'd20
    `define VIDEO_V_ACTIVE_LINES  16'd720
    `define VIDEO_V_FP_LINES      16'd5
    `define VIDEO_V_SYNC_ACTIVE   1'b1
    
    reg [1:0] state_h = `VIDEO_FRONTPORCH;
    reg [15:0] count_h = 1; // 1-based so we will stop when count_h is the total pixels for the current state
    reg inc_v = 1'b0;
    reg [1:0] state_v = `VIDEO_FRONTPORCH;
    reg [15:0] count_v = 1; // 1-based so we will stop when count_v is the total lines for the current state

    // Change outputs on clock.
    // (These update one clock step behind everything else below, but that's
    //  okay because the lengths of all the periods are still correct.)
    always @(posedge clk) begin
        if (reset == 1'b1) begin
            hsync   <= ~`VIDEO_H_SYNC_ACTIVE;
            vsync   <= ~`VIDEO_V_SYNC_ACTIVE;
            visible <= 1'b0;
            x       <= 16'd0;
            y       <= 16'd0;
        end else begin
            hsync   <= (state_h == `VIDEO_SYNC) ^ (~`VIDEO_H_SYNC_ACTIVE);
            vsync   <= (state_v == `VIDEO_SYNC) ^ (~`VIDEO_V_SYNC_ACTIVE);
            visible <= (state_h == `VIDEO_ACTIVE) && (state_v == `VIDEO_ACTIVE);
            x       <= count_h - 1;
            y       <= count_v - 1;
         end
    end

    // Horizontal state machine
    always @(posedge clk) begin
        if (reset == 1'b1) begin
            count_h <= 16'b1;
            state_h <= `VIDEO_FRONTPORCH;
        end else begin
            inc_v <= 0;
            count_h <= count_h + 16'd1;

            case (state_h)
                `VIDEO_SYNC: begin
                    if (count_h == `VIDEO_H_SYNC_PIXELS) begin
                        state_h <= `VIDEO_BACKPORCH;
                        count_h <= 16'b1;
                    end
                end
                `VIDEO_BACKPORCH: begin
                    if (count_h == `VIDEO_H_BP_PIXELS) begin
                        state_h <= `VIDEO_ACTIVE;
                        count_h <= 16'b1;
                    end
                end
                `VIDEO_ACTIVE: begin
                    if (count_h == `VIDEO_H_ACTIVE_PIXELS) begin
                        state_h <= `VIDEO_FRONTPORCH;
                        count_h <= 16'b1;
                    end
                end
                `VIDEO_FRONTPORCH: begin
                    if (count_h == `VIDEO_H_FP_PIXELS) begin
                        state_h <= `VIDEO_SYNC;
                        count_h <= 16'b1;
                        inc_v <= 1;
                    end
                end
            endcase
        end
    end

    // Vertical state machine
    always @(posedge clk) begin
        if (reset == 1'b1) begin
            count_v <= 16'b1;
            state_v <= `VIDEO_FRONTPORCH;
        end else begin
            if (inc_v) begin
                count_v <= count_v + 16'd1;
                case (state_v)
                    `VIDEO_SYNC: begin
                        if (count_v == `VIDEO_V_SYNC_LINES) begin
                            state_v <= `VIDEO_BACKPORCH;
                            count_v <= 16'b1;
                        end
                    end
                    `VIDEO_BACKPORCH: begin
                        if (count_v == `VIDEO_V_BP_LINES) begin
                            state_v <= `VIDEO_ACTIVE;
                            count_v <= 16'b1;
                        end
                    end
                    `VIDEO_ACTIVE: begin
                        if (count_v == `VIDEO_V_ACTIVE_LINES) begin
                            state_v <= `VIDEO_FRONTPORCH;
                            count_v <= 16'b1;
                        end
                    end
                    `VIDEO_FRONTPORCH: begin
                        if (count_v == `VIDEO_V_FP_LINES) begin
                            state_v <= `VIDEO_SYNC;
                            count_v <= 16'b1;
                        end
                    end
                endcase
            end
        end
    end

endmodule
