module mux_2_1_tb;
 reg i0, i1, sel;
 wire y;
 
 mux_2_1 mux(sel, i0, i1, y);
 initial begin
 $monitor("sel = %h: i0 = %h, i1 = %h --> y = %h", sel, i0, i1, y);
 i0 = 0; i1 = 1;
 sel = 0;
 #2;
 sel = 1;
 #2;
 i0 = 1; i1 = 0;
 sel = 1;
 #2;
 sel = 0;
 end
endmodule
