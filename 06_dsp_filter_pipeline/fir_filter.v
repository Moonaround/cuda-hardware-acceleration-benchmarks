// 3-Tap Signed Finite Impulse Response (FIR) Filter Engine
// Demonstrating structural pipeline registers and hardware multiplication arrays.

module fir_filter (
    input  wire        clk,        // System Clock Line (Synchronizes component state)
    input  wire        rst,        // Synchronous Hardware Reset
    input  wire [7:0]  X,          // 8-Bit Signed Input Signal Stream
    output reg  [15:0] Y           // 16-Bit Signed Filtered Output Stream
);

    // Hardware Component Setup: Delay Registers (Tap Pipeline)
    reg [7:0] x0, x1, x2;

    // Filter Coefficients mapped from MATLAB analysis (H =)
    localparam signed [7:0] H0 = 8'sd2;
    localparam signed [7:0] H1 = 8'sd4;
    localparam signed [7:0] H2 = 8'sd2;

    // Structural Sequential Execution Block
    always @(posedge clk) begin
        if (rst) begin
            // Clear internal data paths on system reset
            x0 <= 8'sd0;
            x1 <= 8'sd0;
            x2 <= 8'sd0;
            Y  <= 16'sd0;
        end else begin
            // Shift data through component registers on every clock cycle
            x0 <= X;
            x1 <= x0;
            x2 <= x1;

            // Mathematical Multiply-Accumulate (MAC) Circuit Engine
            // Leverages parallel multipliers and structural adder trees
            Y <= (X * H0) + (x0 * H1) + (x1 * H2);
        end
    end

endmodule
