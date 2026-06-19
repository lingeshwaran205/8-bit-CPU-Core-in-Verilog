`timescale 1ns / 1ps
module t_state_counter(
    input  clk,
    input  rst,
    input  clr_t,
    input  HLT_1,
    output reg [2:0] t_state
);

always @(posedge clk or posedge rst)
begin
    if(rst)
        t_state <= 3'b000;       
    else if(HLT_1)
        t_state <= t_state;      
    else if(clr_t)
        t_state <= 3'b000;       
    else
    begin
        case(t_state)
            3'b000: t_state <= 3'b001;  
            3'b001: t_state <= 3'b010;   
            3'b010: t_state <= 3'b011;   
            3'b011: t_state <= 3'b100;   
            default:
                t_state <= 3'b000;
        endcase
  end
end
endmodule
