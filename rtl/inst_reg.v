`timescale 1ns / 1ps

module IR(
    input             clk,
    input             rst,
    input             II,

    input      [7:0]  bus,

    output reg [7:0]  ir_out,

    output     [3:0]  op_code,
    output     [3:0]  operand,

    output     [7:0]  ir_data
);

always @(posedge clk or posedge rst)
begin
    if(rst)
        ir_out <= 8'h00;
    else if(II)
        ir_out <= bus;
end

assign op_code = ir_out[7:4];

assign operand = ir_out[3:0];

assign ir_data = {4'b0000, operand};

endmodule
