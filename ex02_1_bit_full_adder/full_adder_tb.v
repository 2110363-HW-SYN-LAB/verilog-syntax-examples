`timescale 1ns/1ns

module full_adder_tb();
    reg a, b, cin;
    wire s, cout;

    full_adder fa1 (a, b, cin, s, cout);

    initial begin
        $dumpfile("full_adder_tb.vcd");
        $dumpvars(0, full_adder_tb);

        a = 0;
        b = 0;
        cin = 0;
        #10
        a = 1;
        #10
        a = 0; 
        b = 1;
        #10
        a = 1;
        #10
        a = 0;
        b = 0;
        cin = 1;
        #10
        a = 1;
        #10
        a = 0;
        b = 1;
        #10
        a = 1;
        #10
        $finish;
    end

    always begin
        #1 $display("a=%b, b=%b, cin=%b, s=%b, cout=%b", a, b, cin, s, cout);
    end
endmodule