// alternative syntax easier to read and beautiful code

module better_full_adder (
    input  wire a,
    input  wire b,
    input  wire cin,
    output wire s,
    output wire cout
);

    // packing bit
    assign {cout, s} = a + b + cin;

endmodule
