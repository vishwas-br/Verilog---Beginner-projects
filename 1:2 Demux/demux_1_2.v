module demux_1_2(
  input sel,
  input in,
  output reg y0, 
  output reg y1);
  initial begin
    y0 = 0;
    y1 = 0;
  end

  assign y1 = sel & in;
  assign y0 = ~sel & in;

  end
endmodule
