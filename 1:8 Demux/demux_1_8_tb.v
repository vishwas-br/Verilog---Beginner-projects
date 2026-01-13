module demux_1_8_tb;
  reg [2:0] sel;
 reg in;
 wire y0, y1, y2, y3, y4, y5, y6, y7;
 
 demux_1_4 demux(sel, in, y0, y1, y2, y3, y4, y5, y6, y7);
 
 initial begin
   $monitor("sel = %b, in = %b, y0 = %0b, y1 = %0b, y2 = %0b, y3 = %0b, y4 = %0b, y5 = %0b, y6 = %0b, y7 = %0b", sel, i, y0, y1, y2, y3, y4, y5, y6, y7);
    sel = 3'b000; in = 0; #1;
    sel = 3'b000; in = 1; #1;
    sel = 3'b001; in = 0; #1;
    sel = 3'b001; in = 1; #1;
    sel = 3'b010; in = 0; #1;
    sel = 3'b010; in = 1; #1;
    sel = 3'b011; in = 0; #1;
    sel = 3'b011; in = 1; #1;
    sel = 3'b100; in = 0; #1;
    sel = 3'b100; in = 1; #1;
    sel = 3'b101; in = 0; #1;
    sel = 3'b101; in = 1; #1;
    sel = 3'b110; in = 0; #1;
    sel = 3'b110; in = 1; #1;
    sel = 3'b111; in = 0; #1;
    sel = 3'b111; in = 1; #1;
  end
endmodule
