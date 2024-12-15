`timescale 1ns / 1ns

module dff_tb ();

    reg d;
    reg clk;
    wire q;

    dff dff_inst (
        .q(q),
        .d(d),
        .clk(clk)
    );

    initial clk = 0;

    // Create a clock signal with a period of 10ns
    always begin
        #5 clk = ~clk;
    end

    initial begin
        $dumpfile("dff_tb.vcd");
        $dumpvars(0, dff_tb);

        d = 0;
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        #20 d = 0;
        #20 d = 1;
        #20 $finish;
    end

    
endmodule