// Max Benedict Chavez, S16
module odd_upordown_counter_tb;

    reg clk, reset, UpOrDown;
    wire [3:0] Count;
    
    // Instantiate the counter
    odd_upordown_counter uut (
        .Clk(clk),
        .reset(reset),
        .UpOrDown(UpOrDown),
        .Count(Count)
    );
    
    // Clock generation
    always begin
        #5 clk = ~clk; // Clock with 10 time unit period
    end
    
    // Test stimulus
    initial begin
        // Initialize signals
        clk = 0;
        reset = 0;
        UpOrDown = 1;  // Start with Up mode
        
        // Reset counter
        #10 reset = 1;
        #10 reset = 0;
        
        // Count Up (odd numbers from 0001 to 1111)
        #100 UpOrDown = 1;  // Up mode
        
        // Count Down (odd numbers from 1111 to 0001)
        #100 UpOrDown = 0;  // Down mode
        
        // Finish the simulation
        #50 $finish;
    end
    
    // Monitor the counter value
    initial begin
      $display("Written by Max Benedict Chavez using Behavioral Modelling");
      $display("Odd Up Down Binary Counter");
      $monitor("Time=%0t, Reset=%b, UpOrDown=%b, Count=%b", $time, reset, UpOrDown, Count);
      $dumpfile("AGTKChaM.vcd"); //gtkwave
      $dumpvars();
    end
    
endmodule
