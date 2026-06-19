`timescale 1ns / 1ps

module bus_mux(
    input  [7:0] alu_data,     // ALU output
    input  [7:0] ram_data,     // RAM output
    input  [7:0] ir_data,      // IR operand output
    input  [7:0] a_data,       // A register
    input  [7:0] b_data,       // B register
    input  [7:0] input_data,   // External switches

    input  [3:0] pc_data,      // PC output

    input        CO,
    input        RO,
    input        IO,
    input        AO,
    input        BO,
    input        EO,
    input        IN_EN,

    output reg [7:0] bus
);

always @(*) begin

    bus = 8'h00;

    if(CO)
        bus = {4'b0000, pc_data};

    else if(EO)
        bus = alu_data;

    else if(RO)
        bus = ram_data;

    else if(IO)
        bus = ir_data;

    else if(AO)
        bus = a_data;

    else if(BO)
        bus = b_data;

    else if(IN_EN)
        bus = input_data;

end

endmodule
