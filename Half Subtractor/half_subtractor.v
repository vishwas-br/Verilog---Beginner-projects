module half_subtractor(a, b, diff, borrow);

input  a, b;  //input declaration
output diff, borrow;  //output declaration

assign diff   =  a ^ b;  
assign borrow =  (~a) & b;  
  
endmodule 

