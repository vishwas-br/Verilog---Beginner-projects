module demux_1_8(
  input [2:0] sel,
  input in,
  output reg y0, y1, y2, y3, y4, y5, y6, y7);

  always @(*) begin
    {y0,y1,y2,y3,y4,y5,y6,y7} = 8'b0;
    case(sel)
      3'b000: y0 = in;
      3'b001: y1 = in;
      3'b010: y2 = in;
      3'b011: y3 = in;
      3'b100: y4 = in;
      3'b101: y5 = in;
      3'b110: y6 = in;
      3'b111: y7 = in;
    endcase
  end
endmodule
