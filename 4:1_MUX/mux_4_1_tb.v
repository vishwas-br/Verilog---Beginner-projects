module mux_4_1_tb()
  reg [1:0] sel;
  reg in0, in1, in2, in3;
  wire y;

  mux_4_1 mux(sel, in0, in1, in2, in3, y);
  initial begin
    $monitor("sel = %b -> i3 = %0b, i2 = %0b ,i1 = %0b, i0 = %0b -> y = %0b", sel, i3, i2, i1, i0, y);
    {i3,i2,i1,i0} = 4'h5;
    repeat(6) begin
      sel = $random;
      #5;
    end
  end
endmodule
