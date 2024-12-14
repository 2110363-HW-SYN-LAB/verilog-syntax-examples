// alternative syntax easier to read and beautiful code

`timescale 1ns / 1ns

module better_full_adder_tb ();
    reg a;
    reg b;
    reg cin;
    wire s;
    wire cout;

    better_full_adder fa1 (
        .a   (a),
        .b   (b),
        .cin (cin),
        .s   (s),
        .cout(cout)
    );

    initial begin
        $dumpfile("full_adder_tb.vcd");
        $dumpvars(0, full_adder_tb);

        a   = 0;
        b   = 0;
        cin = 0;

        #10;
        a = 1;

        #10;
        a = 0;
        b = 1;

        #10;
        a = 1;

        #10;
        a   = 0;
        b   = 0;
        cin = 1;

        #10;
        a = 1;

        #10;
        a = 0;
        b = 1;

        #10;
        a = 1;

        #10;
        $finish;
    end

    always begin
        #1 $display("a=%b, b=%b, cin=%b, s=%b, cout=%b", a, b, cin, s, cout);
    end
endmodule
