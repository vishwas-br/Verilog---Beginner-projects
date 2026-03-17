module fixed_priority_arbitrer_tb;
  reg clk, rstn;
  reg [3:0] req;
  wire [3:0] grant;
  
  fixed_priority_arbitrer uut(.clk(clk), .req(req), .rstn(rstn), .grant(grant));

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin 
    rstn = 0; req = 4'b0000;
    #12 rstn = 1;
    #10 req = 4'b0001;
    #10 req = 4'b0010;
    #10 req = 4'b0100;
    #10 req = 4'b1000;
    #20 $finish;
  end

endmodule
