// alternative syntax easier to read and beautiful code

// this is easier to read
module better_half_adder_4 (
    input  [3:0] a,
    input  [3:0] b,
    output [3:0] s,
    output       cout
);

    assign {cout, s} = a + b;

endmodule
