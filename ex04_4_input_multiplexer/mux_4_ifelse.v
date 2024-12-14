module mux_4_ifelse (
    input a, b, c, d,
    input [1:0] sel,
    output reg out
);

    always @(*) begin
        if (sel == 2'b00) begin
            out = a;
        end else if (sel == 2'b01) begin
            out = b;
        end else if (sel == 2'b10) begin
            out = c;
        end else if (sel == 2'b11) begin
            out = d;
        end else begin
            out = 1'bx;
        end
    end

endmodule