module param_half_adder #(
    parameter WIDTH = 1
) (
    input wire [WIDTH-1:0] a,
    input wire [WIDTH-1:0] b,
    output wire [WIDTH-1:0] sum,
    output wire carry
);

    assign {carry, sum} = a + b;

endmodule
