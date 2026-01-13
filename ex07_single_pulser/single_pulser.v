module single_pulser (
    input  wire in,
    input  wire rst,
    input  wire clk,
    output wire out
);
    // Declare local parameters for states
    localparam LowWaiting = 2'b00;
    localparam EdgeDetected = 2'b01;
    localparam HighWaiting = 2'b10;

    // Declare state
    reg [1:0] state;

    // Output logic
    assign out = (state == EdgeDetected) ? 1'b1 : 1'b0;

    // State transition logic
    always @(posedge clk) begin
        if (rst) begin
            state <= LowWaiting;  // Reset state to LowWaiting
        end else begin
            case (state)
                LowWaiting: begin
                    if (in) begin
                        state <= EdgeDetected;  // Transition to EdgeDetected on input '1'
                    end
                end

                EdgeDetected: begin
                    state <= (in == 1) ? HighWaiting : LowWaiting;
                end

                HighWaiting: begin
                    if (!in) begin
                        state <= LowWaiting;  // Transition back to LowWaiting on input '0'
                    end
                end

                default: begin
                    state <= LowWaiting;  // Fallback to LowWaiting
                end
            endcase
        end
    end

endmodule
