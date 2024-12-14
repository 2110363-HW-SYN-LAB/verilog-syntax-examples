// alternative syntax easier to read and beautiful code

module better_full_adder (
    input  a,
    input  b,
    input  cin,
    output s,
    output cout
);

    // packing bit
    assign {cout, s} = a + b + cin;

endmodule
