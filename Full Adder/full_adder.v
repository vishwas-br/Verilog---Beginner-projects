module full_adder(a, b, cin, sum, cout);
                     
//Port declaration
input a, b, cin;    
output sum, cout;

//sum and carry expression for full adder  
assign sum   = a ^ b ^ cin;
assign cout = (a & b) | (b & cin) | (cin & a);
  
endmodule
