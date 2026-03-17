module weighted_arbitrer( input clk, 
                          input rstn, 
                          input [3:0] req, 
                          input [3:0] w0, 
                          input [3:0] w1, 
                          input [3:0] w2, 
                          input [3:0] w3, 
                          output reg [3:0] grant);
  reg [3:0] cnt0, cnt1, cnt2, cnt3;
  reg [1:0] pointer;  

  always @(posedge clk) begin
    if(!rstn) begin
    pointer <= 2'b00;
    grant <= 4'b0000;
    cnt0 <= w0;
    cnt1 <= w1;
    cnt2 <= w2;    
    cnt3 <= w3;
  end else begin
    grant <= 4'b0000; 
    case (pointer)
      2'b00: if (req[0] && cnt0 > 1) begin
                 pointer <= 2'b01;
                 grant <= 4'b0001;
                 cnt0 <= cnt0 - 1; 
             end else pointer <= 2'b01;

      2'b01: if (req[1] && cnt1 > 1) begin
                 pointer <= 2'b10;
                 grant <= 4'b0010;
                 cnt1 <= cnt1 - 1; 
             end else pointer <= 2'b10;

      2'b10: if (req[2] && cnt2 > 1) begin
                 pointer <= 2'b11;
                 grant <= 4'b0100;
                 cnt2 <= cnt2 - 1; 
             end else pointer <= 2'b11;

      2'b11: if (req[3] && cnt3 > 1) begin
                 pointer <= 2'b00;
                 grant <= 4'b1000;
                 cnt3 <= cnt3 - 1; 
             end else pointer <= 2'b00;
    endcase
      
       if (cnt0 == 0 && cnt1 == 0 && cnt2 == 0 && cnt3 == 0) begin
          cnt0 <= w0;
          cnt1 <= w1;
          cnt2 <= w2;
          cnt3 <= w3;
       end 
     end
  end
endmodule


