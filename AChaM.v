module odd_up_down_counter(
    input wire clk,
    input wire reset,
    input wire Y,
    output reg [3:0] count
);

    always @(negedge reset or posedge clk) begin
        if (!reset) 
            count <= 4'b0001; // Reset state
        else if (clk) begin
            if (Y) begin // Up-counting sequence
                case (count)
                    4'b0001: count <= 4'b0011;
                    4'b0011: count <= 4'b0101;
                    4'b0101: count <= 4'b0111;
                    4'b0111: count <= 4'b1001;
                    4'b1001: count <= 4'b1011;
                    4'b1011: count <= 4'b1101;
                    4'b1101: count <= 4'b1111;
                    4'b1111: count <= 4'b0001;
                    default: count <= 4'b0001;
                endcase
            end else begin // Down-counting sequence
                case (count)
                    4'b1111: count <= 4'b1101;
                    4'b1101: count <= 4'b1011;
                    4'b1011: count <= 4'b1001;
                    4'b1001: count <= 4'b0111;
                    4'b0111: count <= 4'b0101;
                    4'b0101: count <= 4'b0011;
                    4'b0011: count <= 4'b0001;
                    4'b0001: count <= 4'b1111;
                    default: count <= 4'b0001;
                endcase
            end
        end
    end
endmodule
