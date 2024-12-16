`timescale 1ns/1ns

module param_half_adder_tb_w1();
    reg a;
    reg b;
    wire sum;
    wire carry;

    param_half_adder uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        $dumpfile("param_half_adder_tb_w1.vcd");
        $dumpvars(0, param_half_adder_tb_w1);

        a = 1'b0;
        b = 1'b0;
        #10;
        a = 1'b1;
        b = 1'b0;
        #10;
        a = 1'b0;
        b = 1'b1;
        #10;
        a = 1'b1;
        b = 1'b1;
        #10;
        $finish;
    end

endmodule
