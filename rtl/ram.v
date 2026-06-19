`timescale 1ns / 1ps

module RAM(
    input             clk,

    input             RO,
    input             DRI,

   
    input             mem_sel,
    input      [3:0]  addr,

  
    inout      [7:0]  bus,

   
    input             prog_mode,
    input             prog_we,
    input             prog_mem_sel,
    input      [3:0]  prog_addr,
    input      [7:0]  prog_data,

   
    input             ram_rst
);

reg [7:0] iram [0:15];
reg [7:0] dram [0:15];

integer i;

assign bus =
       (!prog_mode && RO)
       ? (mem_sel ? dram[addr] : iram[addr])
       : 8'bz;


always @(posedge clk)
begin

    if(ram_rst)
    begin
        for(i = 0; i < 16; i = i + 1)
        begin
            iram[i] <= 8'd0;
            dram[i] <= 8'd0;
        end
    end

    else if(prog_mode)
    begin
        if(prog_we)
        begin
            if(prog_mem_sel)
                dram[prog_addr] <= prog_data;
            else
                iram[prog_addr] <= prog_data;
        end
    end

    else
    begin
        if(DRI)
        begin
            if(mem_sel)
                dram[addr] <= bus;
            else
                iram[addr] <= bus;
        end
    end

end

endmodule
