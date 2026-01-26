`timescale 1ns / 1ps

module single_pulser_tb ();
    reg  clk;
    reg  rst;
    reg  in;
    wire out;

    // Instantiate the single pulser module
    single_pulser uut (
        .clk(clk),
        .rst(rst),
        .in (in),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1;
        in  = 0;
        #10;
        rst = 0;
        #10;
        // Test case 1: Single pulse input
        in = 1;
        #10;
        in = 0;
        #30;
        // Test case 2: Long pulse input
        in = 1;
        #50;
        in = 0;
        #30;

        $finish;
    end

    // Dump waveform
    initial begin
        $dumpfile("single_pulser_tb.vcd");
        $dumpvars(0, single_pulser_tb);
    end

endmodule
