`timescale 1ns/1ns

module half_adder_2_bits_tb ();
    reg  [1:0] a;
    reg  [1:0] b;
    wire [1:0] sum;
    wire       cout;

    // Instantiate the half adder module for simulating
    half_adder_2_bits dut (
        .a   (a),
        .b   (b),
        .sum (sum),
        .cout(cout)
    );

    initial begin
        for (integer i = 0; i < 4; i = i + 1) begin
            for (integer j = 0; j < 4; j = j + 1) begin
                a = i;
                b = j;
                #10;
            end
        end

        $finish;
    end

    // Dump waveform
    initial begin
        $dumpfile("half_adder_2_bits_tb.vcd");
        $dumpvars(0, half_adder_2_bits_tb);
    end

endmodule
