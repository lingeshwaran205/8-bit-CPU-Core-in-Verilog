`timescale 1ns / 1ps

module reg_a(
    input             clk,
    input             rst,
    input             AI,
    input             AO,
    inout      [7:0]  bus,
    output reg [7:0]  A
);

always @(posedge clk or posedge rst)
begin
    if(rst)
        A <= 8'h00;
    else if(AI)
        A <= bus;
end

assign bus = AO ? A : 8'bz;

endmodule
