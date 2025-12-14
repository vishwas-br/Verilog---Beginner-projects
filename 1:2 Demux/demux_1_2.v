module demux_1_2()
  input sel;
  input in;
  output y0, y1;
  
  assign {y0, y1} = sel ? { 1'b0, in} : {in, 1'b0};
endmodule
