module odd_upordown_counter(
   input Clk,
    input reset,      // active high reset
    input UpOrDown,   // high for UP counter and low for Down counter
    output reg [3:0] Count
);
    // Internal states for odd numbers only
    reg [3:0] odd_count [7:0]; // Store the 8 odd states (0001, 0011, 0101, ..., 1111)
    integer i;

    // Initialize the odd_count array with the odd states
    initial begin
        odd_count[0] = 4'b0001;
        odd_count[1] = 4'b0011;
        odd_count[2] = 4'b0101;
        odd_count[3] = 4'b0111;
        odd_count[4] = 4'b1001;
        odd_count[5] = 4'b1011;
        odd_count[6] = 4'b1101;
        odd_count[7] = 4'b1111;
    end

    // Counter behavior based on the clock and reset
    always @(posedge Clk or posedge reset) begin
        if (reset) 
            Count <= 4'b0001;  // Reset the counter to 0001
        else if (UpOrDown)    // Up mode selected
            begin
                // Find current state index and increment
                for (i = 0; i < 7; i = i + 1) begin
                    if (Count == odd_count[i]) begin
                        Count <= odd_count[i + 1];
                    end
                end
                // Wrap around to first odd number if the count is 1111
                if (Count == 4'b1111)
                    Count <= 4'b0001;
            end
        else                  // Down mode selected
            begin
                // Find current state index and decrement
                for (i = 1; i < 8; i = i + 1) begin
                    if (Count == odd_count[i]) begin
                        Count <= odd_count[i - 1];
                    end
                end
                // Wrap around to 1111 if the count is 0001
                if (Count == 4'b0001)
                    Count <= 4'b1111;
            end
    end

endmodule

