module fir_filter (
    input clk,                        // Clock input
    input reset,                      // Reset signal
    input signed [15:0] x,            // Input data
    output reg signed [15:0] y        // Filtered output
);

    // Define filter coefficients (example: a simple 5-tap FIR filter)
    reg signed [15:0] h [4:0];        // Coefficients array (5 coefficients for a 5-tap filter)
    
    // Delay elements to hold previous inputs
    reg signed [15:0] x_delay [4:0];  // Input shift registers for delayed values

    // Initialize filter coefficients (example values)
    initial begin
        h[0] = 16'h1;  // Example coefficient 1
        h[1] = 16'h1;  // Example coefficient 1
        h[2] = 16'h1;  // Example coefficient 1
        h[3] = 16'h1;  // Example coefficient 1
        h[4] = 16'h1;  // Example coefficient 1
    end

    // FIR filter computation
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset the delays and output
            x_delay[0] <= 16'h0;
            x_delay[1] <= 16'h0;
            x_delay[2] <= 16'h0;
            x_delay[3] <= 16'h0;
            x_delay[4] <= 16'h0;
            y <= 16'h0;
        end else begin
            // Shift the input values through the delay registers
            x_delay[0] <= x;            // Current input
            x_delay[1] <= x_delay[0];   // Previous input
            x_delay[2] <= x_delay[1];   // Input delayed by 2 clock cycles
            x_delay[3] <= x_delay[2];   // Input delayed by 3 clock cycles
            x_delay[4] <= x_delay[3];   // Input delayed by 4 clock cycles

            // Compute the output by multiplying the input samples with the coefficients
            y <= (h[0] * x_delay[0]) + (h[1] * x_delay[1]) + (h[2] * x_delay[2]) + 
                 (h[3] * x_delay[3]) + (h[4] * x_delay[4]);  // Accumulating results
        end
    end

endmodule
