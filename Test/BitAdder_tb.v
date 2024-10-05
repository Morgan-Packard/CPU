`timescale 1ns / 1ps
`include "../CPU/alu/arithmatic/BitAdder.v"

module BitAdder_tb;

    reg i_clk;
    reg i_reset;
    reg i_a;
    reg i_b;
    reg i_c;
    wire o_o;
    wire o_c;

    // Instantiate the Adder module
    BitAdder uut (
        .i_clk(i_clk),
        .i_reset(i_reset),
        .i_a(i_a),
        .i_b(i_b),
        .i_c(i_c),
        .o_o(o_o),
        .o_c(o_c)
    );

    // Clock generation
    always #5 i_clk = ~i_clk; // Toggle clock every 5 time units

    initial begin

        $dumpfile("BitAdder.vcd");
        $dumpvars(0,BitAdder_tb);

        // Initialize all inputs
        i_clk = 0;
        i_reset = 0;
        i_a = 0;
        i_b = 0;
        i_c = 0;

        // Apply reset
        i_reset = 1;
        #10; // Wait for 10 time units
        i_reset = 0;

        // Test case 1: 0 + 0 + 0 = 0, carry = 0
        i_a = 0;
        i_b = 0;
        i_c = 0;
        #10;

        // Test case 2: 1 + 0 + 0 = 1, carry = 0
        i_a = 1;
        i_b = 0;
        i_c = 0;
        #10;

        // Test case 3: 1 + 1 + 0 = 0, carry = 1
        i_a = 1;
        i_b = 1;
        i_c = 0;
        #10;

        // Test case 4: 1 + 1 + 1 = 1, carry = 1
        i_a = 1;
        i_b = 1;
        i_c = 1;
        #10;

        // End simulation
        $stop;
    end
endmodule
