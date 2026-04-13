module half_adder(a, b, sum, carry);

  input  a, b;  //input declaration
  output sum, carry;  //output declaration

  assign sum   =  a ^ b;  //xor operation
  assign carry =  a & b;  //and operation
  
endmodule 


//for reference

// a   b    sum     carry
// 0   0     0        0
// 0   1     1        0
// 1   0     1        0
// 1   1     0        1
