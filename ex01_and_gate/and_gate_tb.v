`timescale 1ns/1ns

module and_gate_tb();
    reg a, b;
    wire out;

    and_gate uut(a, b, out);

    initial begin
        $dumpfile("and_gate_tb.vcd");
        $dumpvars(0, and_gate_tb);

        a = 0;
        b = 0;
        #10 a = 1;
        #10 b = 1;
        #10 a = 0;
        #10 b = 0;
        #10 a = 1;
        #10 b = 0;
        #10 a = 0;
        #10 b = 1;
        #10 $finish;
    end
    
endmodule