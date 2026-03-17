module round_robin_arbitrer_tb;
  reg clk, rstn;
  reg [3:0] req;
  wire [3:0] grant;
  
  round_robin_arbitrer uut (.clk(clk), .req(req), .rstn(rstn), .grant(grant));

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
    #10 req = 4'b1001;
    #10 req = 4'b0110;
    #10 req = 4'b0111;
    #10 req = 4'b1111;
    #20 req = 4'b0000;
    #30 $finish;
  end

endmodule
