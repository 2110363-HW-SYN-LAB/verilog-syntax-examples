`timescale 1ns / 1ns

module better_half_adder_4_tb ();
    reg  [3:0] a;
    reg  [3:0] b;
    wire [3:0] s;
    wire       cout;

    better_half_adder_4 ha1 (
        .a   (a),
        .b   (b),
        .s   (s),
        .cout(cout)
    );

    initial begin
        $dumpfile("half_adder_4_tb.vcd");
        $dumpvars(0, half_adder_4_tb);

        a = 4'b0000;
        b = 4'b0000;

        #10;
        a = 4'b0001;

        #10;
        a = 4'b0000;
        b = 4'b0001;

        #10;
        a = 4'b0001;

        #10;
        a = 4'b0010;
        b = 4'b0000;

        #10;
        a = 4'b0011;

        #10;
        a = 4'b0100;
        b = 4'b0001;

        #10;
        a = 4'b0111;
        b = 4'b0011;

        #10;
        a = 4'b1111;
        b = 4'b0001;

        #10;
        a = 4'b1111;
        b = 4'b0010;

        #10;
        a = 4'b0001;
        b = 4'b1111;

        #10;
        a = 4'b0110;
        b = 4'b1111;

        #10;
        a = 4'b1111;
        b = 4'b1111;

        #10;
        $finish;
    end

    always begin
        #1 $display("a=%b, b=%b, s=%b, cout=%b", a, b, s, cout);
    end
endmodule
