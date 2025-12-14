module bin2gray_tb;
 reg [3:0] binary, gray;
 bin2gray b2g(binary, gray);
 
 initial begin
   $monitor("Binary = %b ; Gray = %b", binary, gray);
 binary = 4'b1011; #2;
 binary = 4'b0111; #2;
 binary = 4'b0101; #2;
 binary = 4'b1100; #2;
 binary = 4'b1111; #2;
 binary = 4'b1001; #2;
 binary = 4'b0110; #2;
 binary = 4'b0001; #2;
 binary = 4'b0000; #2;
 end
endmodule
