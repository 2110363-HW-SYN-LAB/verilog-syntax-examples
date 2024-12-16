`timescale 1ns/1ns

module param_half_adder_tb_w2();
    reg [1:0] a;
    reg [1:0] b;
    wire [1:0] sum;
    wire carry;

    param_half_adder #(
        .WIDTH(2)
    ) uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        $dumpfile("param_half_adder_tb_w2.vcd");
        $dumpvars(0, param_half_adder_tb_w2);

        a = 2'b00;
        b = 2'b00;
        #10;
        a = 2'b01;
        b = 2'b00;
        #10;
        a = 2'b00;
        b = 2'b01;
        #10;
        a = 2'b01;
        b = 2'b01;
        #10;
        a = 2'b10;
        b = 2'b01;
        #10;
        a = 2'b01;
        b = 2'b10;
        #10;
        a = 2'b10;
        b = 2'b10;
        #10;
        a = 2'b11;
        b = 2'b11;
        #10;
        $finish;
    end

endmodule
