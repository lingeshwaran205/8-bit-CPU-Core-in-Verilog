`timescale 1ns / 1ps
module control_unit(
    input  [3:0] opcode,
    input  [2:0] t_state,
    input   carry_flag,
    input   zero_flag,
    input  threshold_flag,
    output reg CO,
    output reg RO,
    output reg IO,
    output reg AO,
    output reg BO,
    output reg EO,
    output reg FE,
    output reg MI,
    output reg II,
    output reg AI,
    output reg BI,
    output reg OI,
    output reg DRI,
    output reg J,
    output reg CE,
    output reg FI,
    output reg HLT_1,
    output reg clr_t,
    output reg MEM_SEL,
    output reg [2:0] alu_sel
);

localparam NOP         = 4'h0;
localparam LDA       = 4'h1;
localparam STA       = 4'h2;
localparam ADD       = 4'h3;
localparam SUB       = 4'h4;
localparam LDI       = 4'h5;
localparam JMP       = 4'h6;
localparam JC        = 4'h7;
localparam JZ        = 4'h8;
localparam OUT       = 4'h9;
localparam POPCNT        = 4'hA;
localparam AND_OP    = 4'hB;
localparam OR_OP     = 4'hC;
localparam THRESHOLD = 4'hD;
localparam SHL       = 4'hE;
localparam HLT       = 4'hF;

always @(*) begin

    // Default values
    CO      = 0;
    RO      = 0;
    IO      = 0;
    AO      = 0;
    BO      = 0;
    EO      = 0;
    FE      = 0;
    MI      = 0;
    II      = 0;
    AI      = 0;
    BI      = 0;
    OI      = 0;
    DRI     = 0;
    J       = 0;
    CE      = 0;
    FI      = 0;
    HLT_1   = 0;
    clr_t   = 0;
    MEM_SEL = 0;
    alu_sel = 3'b111;   

    case(t_state)
    
     //T0
     
    3'b000: begin
        CO  = 1;
        MI = 1;
        MEM_SEL = 0;
    end
    
    //T1
    
    3'b001: begin
        RO = 1;
        II = 1;
        CE = 1;
    end
    
    //t2
    
    3'b010: begin
        case(opcode)
        
        NOP:begin
           clr_t=1;
        end 
        
        LDA,STA,ADD,SUB,AND_OP,OR_OP:
        begin
            IO      = 1;
            MI      = 1;
            MEM_SEL = 1;
        end

        LDI:
        begin
            IO    = 1;
            AI    = 1;
            clr_t = 1;
        end

        JMP:
        begin
            IO    = 1;
            J     = 1;
            clr_t = 1;
        end 

        JC:
        begin
            if(carry_flag) begin
                IO = 1;
                J  = 1;
            end
            clr_t = 1;
        end

        JZ:
        begin
            if(zero_flag) begin
                IO = 1;
                J  = 1;
            end
            clr_t = 1;
        end

        SHL:
        begin
            alu_sel = 3'd4;
            EO      = 1;
            AI      = 1;
            FI      = 1;
            clr_t   = 1;
        end

        POPCNT:
        begin
            alu_sel = 3'd5;
            EO      = 1;
            FE      = 1;
            AI      = 1;
            FI      = 1;
            clr_t   = 1;
        end

        THRESHOLD:
        begin
            alu_sel = 3'd6;
            EO      = 1;
             FE      = 1;
            AI      = 1;
            FI      = 1;
            clr_t   = 1;
        end

        OUT:
        begin
            AO    = 1;
            OI    = 1;
            clr_t = 1;
        end

        HLT:
        begin
            HLT_1 = 1;
        end

        endcase
    end

    // T3
  
    3'b011: begin

        case(opcode)

        LDA:
        begin
            RO    = 1;
            AI    = 1;
            clr_t = 1;
        end

        STA:
        begin
            AO    = 1;
            DRI   = 1;
            clr_t = 1;
        end

        ADD,SUB,AND_OP,OR_OP:
        begin
            RO = 1;
            BI = 1;
        end

        endcase
    end

    // T4

    3'b100: begin

        case(opcode)

        ADD:
        begin
            alu_sel = 3'd0;
            EO      = 1;
             FE      = 1;
            AI      = 1;
            FI      = 1;
            clr_t   = 1;
        end

        SUB:
        begin
            alu_sel = 3'd1;
            EO      = 1;
             FE      = 1;
            AI      = 1;
            FI      = 1;
            clr_t   = 1;
        end

        AND_OP:
        begin
            alu_sel = 3'd2;
            EO      = 1;
             FE      = 1;
            AI      = 1;
            FI      = 1;
            clr_t   = 1;
        end

        OR_OP:
        begin
            alu_sel = 3'd3;
            EO      = 1;
             FE      = 1;
            AI      = 1;
            FI      = 1;
            clr_t   = 1;
        end

        endcase
    end

    default: begin
    end

    endcase
end

endmodule
