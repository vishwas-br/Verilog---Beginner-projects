module demux_1_2(
  input sel,
  input in,
  output y0, y1);
  
  alwaya @(*) begin
     y0 = 0;
     y1 = 0;
     if (sel == 0)
        y0 = in;
    ]else
        y1 = in;
  end
endmodule
