module fir_filter_tb;
    
    reg clk;
    reg reset;
    reg signed [15:0] x;
    wire signed [15:0] y;

    // Instantiate the FIR filter
    fir_filter fir_inst (
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 100 MHz clock
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        x = 16'h0;  // Initial input signal
        
        // Apply reset
        #10 reset = 0;
        
        // Apply test inputs
        #10 x = 16'h5;  // Input value 5
        #10 x = 16'hA;  // Input value 10
        #10 x = 16'hF;  // Input value 15
        #10 x = 16'h3;  // Input value 3
        #10 x = 16'h7;  // Input value 7
        
        // Finish simulation after some time
        #100 $finish;
    end
    
    // Monitor outputs
    initial begin
        $monitor("Time: %t | x: %h | y: %h", $time, x, y);
    end

endmodule
