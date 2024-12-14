// alternative syntax easier to read and beautiful code

// this is easier to read
module better_half_adder_4 (
    input  wire [3:0] a,
    input  wire [3:0] b,
    output wire [3:0] s,
    output wire       cout
);

    assign {cout, s} = a + b;

endmodule
