module odd_parity_checker (
    input  wire in,
    input  wire rst,
    input  wire clk,
    output wire out
);
    // Delare state
    reg state;

    // Output logic
    assign out = state;

    // State transition logic
    always @(posedge clk) begin
        if (rst) begin
            state <= 1'b0;  // Reset state to even parity
        end else begin
            state <= state ^ in;  // Toggle state on input '1'
        end
    end

endmodule
