`timescale 1ns / 1ps

module MAR #(
    parameter ADDR_WIDTH = 4
)(
    input                    clk,
    input                    rst,
    input                    MI,

    input                    mem_sel_in,
    input  [ADDR_WIDTH-1:0]  mar_in,

    output reg               mem_sel_out,
    output reg [ADDR_WIDTH-1:0] addr_out
);

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        mem_sel_out <= 1'b0;
        addr_out    <= {ADDR_WIDTH{1'b0}};
    end
    else if(MI)
    begin
        mem_sel_out <= mem_sel_in;
        addr_out    <= mar_in;
    end
end

endmodule
