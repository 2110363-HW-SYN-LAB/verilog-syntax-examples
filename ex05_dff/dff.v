module dff (
    output reg  q,
    input  wire d,
    input  wire clk
);

    always @(posedge clk) begin
        q <= d;
    end

endmodule
