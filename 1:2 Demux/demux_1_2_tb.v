module demux_1_2_tb;
 reg sel, in;
 wire y0, y1;
 
   demux_1_2 demux(sel, in, y0, y1);
   initial begin
     $monitor("sel = %h: in = %h ; y0 = %h, y1 = %h", sel, in, y0, y1);
     sel=0; in=0; #1;
     sel=0; in=1; #1;
     sel=1; in=0; #1;
     sel=1; in=1; #1;
   end
endmodule
