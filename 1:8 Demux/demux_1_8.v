module demux_1_8()
  input [2:0] sel;
  input in;
  output y0, y1, y2, y3, y4, y5, y6, y7, y8;

  always @(*) begin
    case(sel)
      3'h000: {y0, y1, y2, y3, y4, y5, y6, y7, y8} = {in, 7'b0};
      3'h001: {y0, y1, y2, y3, y4, y5, y6, y7, y8} = {1'b0, in, 6'b0};
      3'h010: {y0, y1, y2, y3, y4, y5, y6, y7, y8} = {2'b0, in, 5'b0};
      3'h011: {y0, y1, y2, y3, y4, y5, y6, y7, y8} = {3'b0, in, 4'b0};
      3'h100: {y0, y1, y2, y3, y4, y5, y6, y7, y8} = {4'b0, in, 3'b0};
      3'h101: {y0, y1, y2, y3, y4, y5, y6, y7, y8} = {5'b0, in, 2'b0};
      3'h110: {y0, y1, y2, y3, y4, y5, y6, y7, y8} = {6'b0, in, 1'b0};
      3'h111: {y0, y1, y2, y3, y4, y5, y6, y7, y8} = { 7'b0, in};
      default: $display("Invalid sel input");
    endcase
  end
endmodule
