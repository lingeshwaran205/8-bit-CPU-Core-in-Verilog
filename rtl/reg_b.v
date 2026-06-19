`timescale 1ns / 1ps

module reg_b(
    input             clk,
    input             rst,

    input             BI,

    inout      [7:0]  bus,

    output reg [7:0]  B
);

always @(posedge clk or posedge rst)
begin
    if(rst)
        B <= 8'h00;
    else if(BI)
        B <= bus;
end

endmodule
