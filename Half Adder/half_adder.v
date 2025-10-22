module half_adder(a, b, sum, carry);

//Port declaration

input  a, b;  //input declaration
output sum, carry;  //output declaration
  
//sum and carry expression for half adder

assign sum   =  a ^ b;  //xor operation
assign carry =  a & b;  //and operation
  
endmodule 
