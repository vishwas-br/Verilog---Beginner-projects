module mux_8_1_tb()
  reg [2:0] sel;
  reg in0, in1, in2, in3, in4, in5, in6, in7;
  wire y;

  mux_4_1 mux(sel, in0, in1, in2, in3, in4, in5, in6, in7, y);
  initial begin
    $monitor("sel = %b -> in7 = %0b, in6 = %0b ,in5 = %0b, in4 = %0b, in3 = %0b, in2 = %0b ,in1 = %0b, in0 = %0b -> y = %0b", sel, in7, in6, in5, in4, in3, in2, in1, in0, y);
    {i3,i2,i1,i0} = 4'h5;
    repeat(15) begin
      sel = $random;
      #5;
    end
  end
endmodule
