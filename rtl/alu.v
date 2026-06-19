`timescale 1ns / 1ps

module alu(
    input  [7:0] A,
    input  [7:0] B,
    input  [2:0] alu_sel,

    output reg [7:0] Y,
    output reg       carry_out,
    output wire      threshold_out
);

localparam ADD       = 3'd0;
localparam SUB       = 3'd1;
localparam AND_OP    = 3'd2;
localparam OR_OP     = 3'd3;
localparam SHL       = 3'd4;
localparam POPCNT    = 3'd5;
localparam THRESHOLD = 3'd6;
localparam PASS      = 3'd7;

wire [3:0] count;

assign count =
    A[0]+A[1]+A[2]+A[3]+
    A[4]+A[5]+A[6]+A[7];

assign threshold_out = (count >= 5);

reg [8:0] sum;

always @(*)
begin

    Y = 8'h00;
    carry_out = 1'b0;
    sum = 9'd0;

    case(alu_sel)

        ADD:
        begin
            sum = {1'b0,A} + {1'b0,B};
            Y = sum[7:0];
            carry_out = sum[8];
        end

        SUB:
        begin
            sum = {1'b0,A} - {1'b0,B};
            Y = sum[7:0];
            carry_out = ~sum[8];
        end

        AND_OP:
            Y = A & B;

        OR_OP:
            Y = A | B;

        SHL:
        begin
            Y = A << 1;
            carry_out = A[7];
        end

        POPCNT:
            Y = {4'b0000,count};

        THRESHOLD:
            Y = {7'b0000000,threshold_out};

        PASS:
            Y = A;

        default:
            Y = 8'h00;

    endcase
end

endmodule
