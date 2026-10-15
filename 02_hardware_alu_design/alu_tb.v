// ALU Verification Testbench Block
`timescale 1ns / 1ps

module alu_tb;

    // Inputs modeled as registers (we control their values)
    reg [3:0] A;
    reg [3:0] B;
    reg [1:0] Opcode;

    // Outputs modeled as wires (monitored lines)
    wire [3:0] ALU_Result;
    wire       CarryOut;

    // Instantiate the Unit Under Test (UUT)
    alu_core uut (
        .A(A),
        .B(B),
        .Opcode(Opcode),
        .ALU_Result(ALU_Result),
        .CarryOut(CarryOut)
    );

    initial begin
        // Display header tracking columns in the terminal console output
        $display("Time\t A \t B \t Opcode \t Result \t CarryOut");
        $display("------------------------------------------------------------");

        #10;
        // Test Case 1: Arithmetic Addition (A = 5, B = 3) -> Expect 8, Carry 0
        A = 4'b0101; B = 4'b0011; Opcode = 2'b00;
        #10; $display("%0t\t %b (%d)\t %b (%d)\t %b (ADD)\t %b (%d)\t %b", $time, A, A, B, B, Opcode, ALU_Result, ALU_Result, CarryOut);

        // Test Case 2: Arithmetic Addition overflow (A = 12, B = 6) -> Expect 2, Carry 1
        A = 4'b1100; B = 4'b0110; Opcode = 2'b00;
        #10; $display("%0t\t %b (%d)\t %b (%d)\t %b (ADD)\t %b (%d)\t %b", $time, A, A, B, B, Opcode, ALU_Result, ALU_Result, CarryOut);

        // Test Case 3: Bitwise AND Logic (A = 5, B = 3) -> Expect 1 (0101 & 0011 = 0001)
        A = 4'b0101; B = 4'b0011; Opcode = 2'b10;
        #10; $display("%0t\t %b (%d)\t %b (%d)\t %b (AND)\t %b (%d)\t %b", $time, A, A, B, B, Opcode, ALU_Result, ALU_Result, CarryOut);

        $finish; // End the simulation run
    end

endmodule
