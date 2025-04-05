module testbench;
    reg clk, reset, Y;
    wire [3:0] count;
 
    odd_up_down_counter uut (.clk(clk), .reset(reset), .Y(Y), .count(count));
 
    initial begin
        clk = 0;
        reset = 0;
        Y = 1;
        #10 reset = 1;
        #100 Y = 0;
        #100 $stop;
    end

    always #5 clk = ~clk;
 
    initial begin
         $display("Written by Max Benedict Chavez using Gate-Level Modelling");
    $display("Model Type: Gate-Level Modeling");
        $monitor("Time = %0t, reset = %b, Y = %b, count = %b", $time, reset, Y, count);
    $dumpfile("RGTKChaM.vcd"); //gtkwave
    $dumpvars();
    end
endmodule
