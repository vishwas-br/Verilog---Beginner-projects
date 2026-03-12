module demux_1_4(
  input [1:0] sel;
  input in;
  output y0, y1, y2, y3);

  always @(*) begin
    case(sel)
      2'h00: {y0, y1, y2, y3} = {in, 3'b0};
      2'h01: {y0, y1, y2, y3} = {1'b0, in, 2'b0};
      2'h10: {y0, y1, y2, y3} = {2'b0, in, 1'b0};
      2'h11: {y0, y1, y2, y3} = {3'b0, in};
      default: $display("Invalid sel input");
    endcase
  end
endmodule
