`timescale 1ns / 1ns

module counter_4_bits_tb ();
    reg        clk;
    reg        rst;
    reg        enable;
    wire [3:0] count;

    // Instantiate the 4-bit counter
    counter_4_bits uut (
        .clk   (clk),
        .rst   (rst),
        .enable(enable),
        .count (count)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns clock period
    end

    // Monitor count value
    initial begin
        $monitor("Time: %0t | Reset: %b | Enable: %b | Count: %b", $time, rst, enable, count);
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst    = 1;
        enable = 0;
        #10;  // Hold reset for 10 ns

        rst    = 0;  // Release reset
        enable = 1;  // Enable counting
        // Let the counter run for some time
        #100;

        enable = 0;  // Disable counting
        #20;

        enable = 1;  // Enable counting again
        #80;

        $finish;  // End simulation
    end

    // Dump waveform
    initial begin
        $dumpfile("counter_4_bits_tb.vcd");
        $dumpvars(0, counter_4_bits_tb);
    end

endmodule
