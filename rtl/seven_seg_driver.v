module seven_seg_driver(

    input clk,
    input rst,

    input [7:0] output_reg,
    input [3:0] pc,

    output [3:0] D0_an,
    output [7:0] D0_seg,

    output [3:0] D1_an,
    output [7:0] D1_seg

);

wire [3:0] out_h;
wire [3:0] out_t;
wire [3:0] out_o;

wire [3:0] pc_t;
wire [3:0] pc_o;

wire cpu_clk;

clock_divider clkdiv(
    .clk(clk),
    .rst(rst),
    .clk_enable(1'b1),
    .HLT_1(1'b0),
    .cpu_clk(cpu_clk)
);

assign out_h = output_reg / 100;
assign out_t = (output_reg % 100) / 10;
assign out_o = output_reg % 10;

assign pc_t = pc / 10;
assign pc_o = pc % 10;

sevenseg_mux display0(
    .clk(clk),
    .rst(rst),

    .d0(4'hF),
    .d1(out_o),
    .d2(out_t),
    .d3(out_h),

    .an(D0_an),
    .seg(D0_seg)
);

sevenseg_mux display1(
    .clk(clk),
    .rst(rst),

    .d0(4'hF),
    .d1(4'hF),
    .d2(pc_o),
    .d3(pc_t),

    .an(D1_an),
    .seg(D1_seg)
);

endmodule


module sevenseg_mux(

    input clk,
    input rst,

    input [3:0] d0,
    input [3:0] d1,
    input [3:0] d2,
    input [3:0] d3,

    output reg [3:0] an,
    output reg [7:0] seg

);

wire [7:0] seg0;
wire [7:0] seg1;
wire [7:0] seg2;
wire [7:0] seg3;

seg7_decoder U0 (.digit(d0), .seg(seg0));
seg7_decoder U1 (.digit(d1), .seg(seg1));
seg7_decoder U2 (.digit(d2), .seg(seg2));
seg7_decoder U3 (.digit(d3), .seg(seg3));

reg [15:0] refresh_counter;

always @(posedge clk or posedge rst)
begin
    if(rst)
        refresh_counter <= 16'd0;
    else
        refresh_counter <= refresh_counter + 1'b1;
end

wire [1:0] scan_sel;

assign scan_sel = refresh_counter[15:14];

always @(*) begin

    case(scan_sel)

        2'b00:
        begin
            an  = 4'b1110;
            seg = seg0;
        end

        2'b01:
        begin
            an  = 4'b1101;
            seg = seg1;
        end

        2'b10:
        begin
            an  = 4'b1011;
            seg = seg2;
        end

        default:
        begin
            an  = 4'b0111;
            seg = seg3;
        end

    endcase

end

endmodule


module seg7_decoder(
    input  [3:0] digit,
    output reg [7:0] seg
);

always @(*) begin
    case(digit)

        4'd0: seg = 8'b11000000;
        4'd1: seg = 8'b11111001;
        4'd2: seg = 8'b10100100;
        4'd3: seg = 8'b10110000;
        4'd4: seg = 8'b10011001;
        4'd5: seg = 8'b10010010;
        4'd6: seg = 8'b10000010;
        4'd7: seg = 8'b11111000;
        4'd8: seg = 8'b10000000;
        4'd9: seg = 8'b10010000;

        default: seg = 8'b11111111; // blank

    endcase
end

endmodule
