module demux_1_4_tb;
 reg [1:0] sel;
 reg in;
 wire y0, y1, y2, y3;
 
 demux_1_4 demux(sel, in, y0, y1, y2, y3);
 
 initial begin
    $monitor("sel = %b, in = %b, y0 = %0b, y1 = %0b ,y2 = %0b, y3 = %0b", sel, i, y0, y1, y2, y3);
    sel = 2'b00; in = 0; #1;
    sel = 2'b00; in = 1; #1;
    sel = 2'b01; in = 0; #1;
    sel = 2'b01; in = 1; #1;
    sel = 2'b10; in = 0; #1;
    sel = 2'b10; in = 1; #1;
    sel = 2'b11; in = 0; #1;
    sel = 2'b11; in = 1; #1;
  end
endmodule
