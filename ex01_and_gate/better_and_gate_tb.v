// alternative syntax easier to read and beautiful code

`timescale 1ns / 1ns

// module *_tb is for testing tb stand for testbench
module better_and_gate_tb ();

    // declare wire and register one line is so pretty
    reg a;
    reg b;
    wire out;

    // use .PORT_NAME to make it clearly input/output
    better_and_gate uut (
        .a  (a),
        .b  (b),
        .out(out)
    );

    initial begin
        $dumpfile("and_gate_tb.vcd");
        $dumpvars(0, and_gate_tb);

        a = 0;
        b = 0;

        #10;  // waiting 10 ns (ns declare in `timescale at top of file)
        a = 1;

        #10;
        b = 1;

        #10;
        a = 0;

        #10;
        b = 0;

        #10;
        a = 1;

        #10;
        b = 0;

        #10;
        a = 0;

        #10;
        b = 1;

        #10;
        $finish;
    end

endmodule
