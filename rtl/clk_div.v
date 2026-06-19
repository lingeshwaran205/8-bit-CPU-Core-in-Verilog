`timescale 1ns / 1ps

module clock_divider #(
    parameter DIVIDE_COUNT = 100_000_000
)(
    input  wire clk,
    input  wire rst,

    input  wire clk_enable,
    input  wire HLT_1,

    output reg  cpu_clk
);

localparam COUNT_WIDTH = $clog2(DIVIDE_COUNT);

reg [COUNT_WIDTH-1:0] count;

wire cpu_run;

assign cpu_run = clk_enable & ~HLT_1;

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        count   <= 0;
        cpu_clk <= 0;
    end

    else if(cpu_run)
    begin
        if(count == DIVIDE_COUNT-1)
        begin
            count   <= 0;
            cpu_clk <= ~cpu_clk;
        end
        else
            count <= count + 1;
    end

    else
    begin
        count   <= count;   
        cpu_clk <= cpu_clk; 
    end
end

endmodule
