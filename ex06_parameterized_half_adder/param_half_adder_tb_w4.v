`timescale 1ns/1ns

module param_half_adder_tb_w4();
    reg [3:0] a;
    reg [3:0] b;
    wire [3:0] sum;
    wire carry;

    param_half_adder #(
        .WIDTH(4)
    ) uut (
        .a(a),
        .b(b),
        .s(sum),
        .cout(carry)
    );

    initial begin
        $dumpfile("param_half_adder_tb_w4.vcd");
        $dumpvars(0, param_half_adder_tb_w4);

        a = 4'b0000;
        b = 4'b0000;
        #10
        a = 4'b0001;
        #10
        a = 4'b0000; 
        b = 4'b0001;
        #10
        a = 4'b0001;
        #10
        a = 4'b0010;
        b = 4'b0000;
        #10
        a = 4'b0011;
        #10
        a = 4'b0100;
        b = 4'b0001;
        #10
        a = 4'b0111;
        b = 4'b0011;
        #10
        a = 4'b1111;
        b = 4'b0001;
        #10
        a = 4'b1111;
        b = 4'b0010;
        #10
        a = 4'b0001;
        b = 4'b1111;
        #10
        a = 4'b0110;
        b = 4'b1111;
        #10
        a = 4'b1111;
        b = 4'b1111;
        #10
        $finish;
    end

endmodule
