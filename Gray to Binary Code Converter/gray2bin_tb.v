module gray2bin_tb;
 wire [3:0] binary;
 reg [3:0] gray;
 gray2bin g2b(gray, binary);
 
 initial begin
   $monitor("Gray = %b ; Binary = %b", gray, binary);
 gray = 4'b1110; #1;
 gray = 4'b0100; #1;
 gray = 4'b0111; #1;
 gray = 4'b1010; #1;
 gray = 4'b1000; #1;
 gray = 4'b0000; #1;
 gray = 4'b0100; #1;
 gray = 4'b0110; #1;
 gray = 4'b1011; #1;
 gray = 4'b0000;
 end
endmodule
