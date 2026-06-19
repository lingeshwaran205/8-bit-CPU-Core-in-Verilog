`timescale 1ns / 1ps

module output_register(
    input        clk,
    input        rst,

    input        OI,

    input  [7:0] bus,

    output reg [7:0] out_reg
);

always @(posedge clk or posedge rst)
begin
    if(rst)
        out_reg <= 8'h00;
    else if(OI)
        out_reg <= bus;
end

endmodule
