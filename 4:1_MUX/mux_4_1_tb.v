module mux_4_1_tb()
  reg [1:0] sel;
  reg in0, in1, in2, in3;
  wire y;

  mux_4_1 mux(sel, in0, in1, in2, in3, y);
  initial begin
    $monitor("sel = %b -> in3 = %0b, in2 = %0b ,in1 = %0b, in0 = %0b -> y = %0b", sel, in3, in2, in1, in0, y);
    {in3,in2,in1,in0} = 4'h5;
    for (sel = 0; sel < 4; sel = sel + 1) #5;
    
    {in3,in2,in1,in0} = 4'h7;
    for (sel = 0; sel < 4; sel = sel + 1) #5;

    {in3,in2,in1,in0} = 4'h2; 
    for (sel = 0; sel < 4; sel = sel + 1) #5;

    {in3,in2,in1,in0} = 4'h6; 
    for (sel = 0; sel < 4; sel = sel + 1) #5;
    end
  end
endmodule
