`timescale 1ns / 1ns

module better_mux_4_tb ();
    reg        a;
    reg        b;
    reg        c;
    reg        d;
    reg  [1:0] sel;
    wire       out;

    better_mux_4 mux1 (
        .a  (a),
        .b  (b),
        .c  (c),
        .d  (d),
        .sel(sel),
        .out(out)
    );

    initial begin
        $dumpfile("mux_4_tb.vcd");
        $dumpvars(0, mux_4_tb);

        a   = 1'b0;
        b   = 1'b1;
        c   = 1'b0;
        d   = 1'b1;
        sel = 2'b00;

        #10;
        sel = 2'b01;

        #10;
        sel = 2'b10;

        #10;
        sel = 2'b11;

        #10;
        a = 1'b1;
        b = 1'b0;
        c = 1'b1;
        d = 1'b0;

        #10;
        sel = 2'b10;

        #10;
        sel = 2'b01;

        #10;
        sel = 2'b00;

        #10;
        $finish;
    end

endmodule
