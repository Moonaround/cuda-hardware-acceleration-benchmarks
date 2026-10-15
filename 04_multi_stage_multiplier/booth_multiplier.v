// Phase 4: Multi-Stage Computer Arithmetic Array
// 4-Bit Radix-2 Booth Multiplier Core Implementation

module booth_multiplier (
    input  wire [3:0] M,       // Multiplicand Vector (4-Bit signed input)
    input  wire [3:0] Q,       // Multiplier Vector (4-Bit signed input)
    output reg  [7:0] Product  // 8-Bit Signed Multiplication Output
);

    reg [3:0] A;       // Accumulator Register
    reg [3:0] Q_reg;   // Working Multiplier Shift Register
    reg       Q_minus1;// Appended Booth bit for transition detection
    integer   i;       // Loop iteration index for hardware unwinding

    // Structural execution block managing multi-stage arithmetic shifts
    always @(*) begin
        // 1. Initialize structural registers matching hardware defaults
        A        = 4'b0000;
        Q_reg    = Q;
        Q_minus1 = 1'b0;

        // 2. Unwind the 4 arithmetic execution stages sequentially on silicon
        for (i = 0; i < 4; i = i + 1) begin
            case ({Q_reg[0], Q_minus1})
                2'b10: begin // Subtraction Step: Enforce 2's Complement Subtract
                    A = A - M;
                end
                2'b01: begin // Addition Step: Add Multiplicand to Accumulator
                    A = A + M;
                end
                default: begin // 00 or 11: No Operation (Shift only)
                    A = A;
                end
            endcase

            // 3. Multi-Stage Structural Alignment: Arithmetic Right Shift (ARS)
            // Preserves the sign bit during shift operations across internal register boundaries
            {A, Q_reg, Q_minus1} = {A[3], A, Q_reg};
        end

        // 4. Output Assign Stage: Route finished bitstreams to the external product pins
        Product = {A, Q_reg};
    end

endmodule
