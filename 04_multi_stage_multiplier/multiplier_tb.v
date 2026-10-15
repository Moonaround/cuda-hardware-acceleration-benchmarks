// Phase 4: Booth Multiplier Verification Testbench Block
`timescale 1ns / 1ps

module multiplier_tb;

    // Inputs modeled as hardware registers
    reg [3:0] M;
    reg [3:0] Q;

    // Outputs modeled as wire traces
    wire [7:0] Product;

    // Instantiate the Unit Under Test (UUT)
    booth_multiplier uut (
        .M(M),
        .Q(Q),
        .Product(Product)
    );

    initial begin
        // Print tracking columns directly into your VS Code terminal window
        $display("Time\t Multiplicand (M) \t Multiplier (Q) \t Product (Signed Decimal)");
        $display("-------------------------------------------------------------------------");

        #10;
        // Test Case 1: Positive Signed Multiplication (3 x 2 = 6)
        M = 4'b0011; Q = 4'b0010;
        #10; $display("%0t\t %b (%d)    \t\t %b (%d)  \t\t %b (%d)", $time, M, $signed(M), Q, $signed(Q), Product, $signed(Product));

        // Test Case 2: Negative Signed Multiplication (-4 x 3 = -12)
        // -4 in 4-bit 2's complement is 1100
        M = 4'b1100; Q = 4'b0011;
        #10; $display("%0t\t %b (%d)    \t\t %b (%d)  \t\t %b (%d)", $time, M, $signed(M), Q, $signed(Q), Product, $signed(Product));

        // Test Case 3: Double Negative Multiplication (-2 x -3 = 6)
        M = 4'b1110; Q = 4'b1101;
        #10; $display("%0t\t %b (%d)    \t\t %b (%d)  \t\t %b (%d)", $time, M, $signed(M), Q, $signed(Q), Product, $signed(Product));

        $finish;
    end

endmodule
