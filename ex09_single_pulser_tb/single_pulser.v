`timescale 1ns / 1ps

module single_pulser(
    input wire clk,
    input wire rst,
    input wire in,
    output wire out
);

    reg [1:0] state;

    localparam IDLE = 2'b00;
    localparam PULSE = 2'b01;
    localparam WAIT = 2'b10;

    assign out = (state == PULSE) ? 1'b1 : 1'b0;

    always @(posedge clk) begin
        if (rst) begin
            state <= IDLE;
        end else begin
            case (state)
                IDLE: begin
                    if (in) begin
                        state <= PULSE;
                    end
                end
                PULSE: begin
                    state <= (in) ? WAIT : IDLE;
                end
                WAIT: begin
                    if (!in) begin
                        state <= IDLE;
                    end
                end
                default: state <= IDLE;
            endcase
        end
    end

endmodule
