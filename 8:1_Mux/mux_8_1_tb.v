module mux_8_1_tb()
  reg [2:0] sel;
  reg in0, in1, in2, in3, in4, in5, in6, in7;
  wire y;

  mux_8_1 mux(.sel(sel), .in0(in0), .in1(in1), .in2(in2), .in3(in3), .in4(in4), .in5(in5), .in6(in6), .in7(in7), .y(y));
  initial begin
    $monitor("sel = %b -> inputs = {%b%b%b%b%b%b%b%b} -> y = %0b", sel, in7, in6, in5, in4, in3, in2, in1, in0, y);
    {in7,in6,in5,in4,in3,in2,in1,in0} = 8'hA5;
    for (sel = 0; sel < 8; sel = sel + 1) #5;

    {in7,in6,in5,in4,in3,in2,in1,in0} = 8'h3C; 
    for (sel = 0; sel < 8; sel = sel + 1) #5;

    {in7,in6,in5,in4,in3,in2,in1,in0} = 8'haf; 
    for (sel = 0; sel < 8; sel = sel + 1) #5;
    
    end
  end
endmodule
