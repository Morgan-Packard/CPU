module BitAdder (
    i_clk, // input clock
    i_reset, // input reset
    i_a, // input wire a
    i_b, // input wire b
    i_c, // input wire carry
    o_o, // output wire output 
    o_c // output wire carry 
);
    input wire i_clk;
    input wire i_reset;
    input wire i_a;
    input wire i_b;
    input wire i_c;
    output reg o_o;
    output reg o_c;    

    wire abxor;
    assign abxor = (i_a ^ i_b);

    always @(posedge i_clk) begin
        if (i_reset) begin
            o_o <= 0;
            o_c <= 0;
        end else begin
            o_o <= (abxor ^ i_c);
            o_c <= ((i_c & abxor) | (i_a & i_b));
        end
    end    
endmodule