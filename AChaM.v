module odd_up_down_counter(
    input wire clk,
    input wire reset,
    input wire Y,
    output reg [3:0] count
);
  // Internal index to map to odd numbers
    reg [2:0] index;

    always @(negedge reset or posedge clk) begin
        if (!reset) begin
            index <= 3'd0;
            count <= 4'b0001; 
        end else begin
            if (Y)
                index <= (index + 1) % 8;
            else
                index <= (index + 7) % 8; 

            count <= (index << 1) | 1; 
        end
      end
    endmodule
