`timescale 1ns / 1ps

module pc #(parameter WIDTH = 4)(
    input clk, rst, J, 
    input CE,
    input [WIDTH-1:0]pc_in,
    output reg [WIDTH-1:0]pc_out
    );
 
    always @(posedge clk or posedge rst) begin
        if(rst)
            pc_out <= {WIDTH{1'b0}};
        else if(J)
            pc_out <= pc_in;
        else if(CE) 
            pc_out <= pc_out + 1;
        else   
            pc_out <= pc_out;
    end
endmodule
