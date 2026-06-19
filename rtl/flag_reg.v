`timescale 1ns / 1ps

module flag_register(

    input clk,
    input rst,

    input FI,

    input carry_in,
    input threshold_in,

    input [7:0] alu_out,

    output reg carry_flag,
    output reg zero_flag,
    output reg threshold_flag
);

always @(posedge clk or posedge rst)
begin

    if(rst)
    begin
        carry_flag     <= 1'b0;
        zero_flag      <= 1'b0;
        threshold_flag <= 1'b0;
    end

    else if(FI)
    begin
        carry_flag     <= carry_in;
        zero_flag      <= (alu_out == 8'h00);
        threshold_flag <= threshold_in;
    end

end

endmodule
