module round_robin_arbitrer ( input clk, 
                              input rstn, 
                              input [3:0] req, 
                              output reg [3:0] grant);

  reg [1:0] pointer; 

  always @(posedge clk) begin
    if(!rstn) begin
       grant <= 4'b0000;
       pointer <= 2'b00;
    end else begin
       grant <= 4'b0000;
       case(pointer)
         2'b00: if (req[0]) begin grant <= 4'b0001; pointer <= 2'b01; end
                else if (req[1]) begin grant <= 4'b0010; pointer <= 2'b10; end
                else if (req[2]) begin grant <= 4'b0100; pointer <= 2'b11; end
                else if (req[3]) begin grant <= 4'b1000; pointer <= 2'b00; end
         2'b01: if (req[1]) begin grant <= 4'b0010; pointer <= 2'b10; end
                else if (req[2]) begin grant <= 4'b0100; pointer <= 2'b11; end
                else if (req[3]) begin grant <= 4'b1000; pointer <= 2'b00; end
                else if (req[0]) begin grant <= 4'b0001; pointer <= 2'b01; end
         2'b10: if (req[2]) begin grant <= 4'b0100; pointer <= 2'b11; end
                else if (req[3]) begin grant <= 4'b1000; pointer <= 2'b00; end
                else if (req[0]) begin grant <= 4'b0001; pointer <= 2'b01; end
                else if (req[1]) begin grant <= 4'b0010; pointer <= 2'b10; end
         2'b11: if (req[3]) begin grant <= 4'b1000; pointer <= 2'b00; end
                else if (req[0]) begin grant <= 4'b0001; pointer <= 2'b01; end
                else if (req[1]) begin grant <= 4'b0010; pointer <= 2'b10; end
                else if (req[2]) begin grant <= 4'b0100; pointer <= 2'b11; end
       endcase
   end
 end
endmodule


