% Automated Hardware Verification Script for FIR Filter Module
clear; clk = 1;

fprintf("🔬 Initializing MATLAB Hardware Verification Loop...\n");

% 1. Mathematical Design Specification
H =; % Filter Coeffs matching Verilog localparam declarations
input_signal = [5, 12, 7, 0, -3]; % Sample data vector sequence
expected_output = zeros(1, length(input_signal));

% 2. Emulate the physical component delay registers step-by-step
x0 = 0; x1 = 0; x2 = 0;
for n = 1:length(input_signal)
    X = input_signal(n);
    
    % Compute the structural MAC step arithmetic
    expected_output(n) = (X * H(1)) + (x0 * H(2)) + (x1 * H(3));
    
    % Update components on clock cycle edge transitions
    x2 = x1;
    x1 = x0;
    x0 = X;
end

% 3. Display Golden Test Bench Verification Vectors
fprintf("\n📊 Generated Golden Test Vectors for Verilog Simulation:\n");
fprintf("Input (X)  -> %s\n", mat2str(input_signal));
fprintf("Expected Output (Y) -> %s\n", mat2str(expected_output));

% Save the test vectors to a shared text file to feed into a testbench
fid = fopen('test_vectors.txt', 'w');
for i = 1:length(input_signal)
    fprintf(fid, "%d %d\n", input_signal(i), expected_output(i));
end
fclose(fid);
fprintf("💾 Tracking matrix exported successfully to 'test_vectors.txt'.\n");
