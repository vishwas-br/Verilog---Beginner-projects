module fixed_priority_arbitrer ( input clk, 
                                 input rstn, 
                                 input [3:0] req, 
                                 output reg [3:0] grant);

 always @(posedge clk)
   if(!rstn)
       grant <= 4'b0000;
   else if (req[0])            //req[0] has highest priority
       grant <= 4'b0001;
   else if (req[1])
       grant <= 4'b0010;
   else if (req[2])
       grant <= 4'b0100;
   else if (req[3])            //req[3] has lowest priority
       grant <= 4'b1000;
   else 
       grant <= 4'b0000;
 
endmodule
