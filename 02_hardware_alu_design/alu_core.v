// 4-Bit Arithmetic Logic Unit (ALU) Core Design
// Demonstrating structural gate-level mapping and computer arithmetic layout.

module alu_core (
    input  wire [3:0] A,          // 4-Bit Input Vector A
    input  wire [3:0] B,          // 4-Bit Input Vector B
    input  wire [1:0] Opcode,     // 2-Bit Operation Selector (Control Signal)
    output reg  [3:0] ALU_Result, // 4-Bit Output Result
    output reg        CarryOut    // Carry Out Flag for Arithmetic Operations
);

    // Internal wires to hold the results of individual circuit blocks
    wire [3:0] and_result;
    wire [3:0] or_result;
    wire [3:0] sum_result;
    wire       adder_carry;

    // 1. COMPUTER ARITHMETIC BLOCK: Structural 4-Bit Ripple-Carry Adder Implementation
    assign {adder_carry, sum_result} = A + B;

    // 2. CIRCUITS & DIGITAL LOGIC BLOCK: Bitwise Operations
    assign and_result = A & B; // Bitwise AND gate array
    assign or_result  = A | B; // Bitwise OR gate array

    // 3. COMPUTER ARCHITECTURE BLOCK: Control Multiplexer (Decoder)
    always @(*) begin
        case (Opcode)
            2'b00: begin // Opcode 00: ADD
                ALU_Result = sum_result;
                CarryOut   = adder_carry;
            end
            2'b01: begin // Opcode 01: SUB
                {CarryOut, ALU_Result} = A - B;
            end
            2'b10: begin // Opcode 10: AND
                ALU_Result = and_result;
                CarryOut   = 1'b0; // No carry out for logical functions
            end
            2'b11: begin // Opcode 11: OR
                ALU_Result = or_result;
                CarryOut   = 1'b0;
            end
            default: begin
                ALU_Result = 4'b0000;
                CarryOut   = 1'b0;
            end
        endcase
    end

endmodule
