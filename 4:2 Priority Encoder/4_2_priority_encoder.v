module 4_2_priority_encoder(input [3:0] in, 
                            output reg valid,
                            output reg [1:0] out);
  
  always @(*) begin
     valid = | in;       
       if      (in[3])  out = 2'b11;
       else if (in[2])  out = 2'b10;
       else if (in[1])  out = 2'b01;
       else if (in[0])  out = 2'b00;
       else out = 2'b00;
     end
endmodule
