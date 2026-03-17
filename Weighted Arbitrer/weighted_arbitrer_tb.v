module weighted_arbitrer_tb;
  reg clk, rstn;
  reg [3:0] req;
  reg [3:0] w0, w1, w2, w3;
  wire [3:0] grant;

  weighted_arbitrer uut (.clk(clk), .rstn(rstn), .req(req), .w0(w0), .w1(w1), .w2(w2), .w3(w3), .grant(grant));

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    rstn = 0; req = 4'b0000;
    w0 = 4; w1 = 2; w2 = 1; w3 = 1;
    #12 rstn = 1;

    #10 req = 4'b1111;
    #100 req = 4'b0000;

    #20 req = 4'b0001;
    #40 req = 4'b0000;
    #20 req = 4'b0010;
    #40 req = 4'b0000;
    #20 req = 4'b0100;
    #40 req = 4'b0000;
    #20 req = 4'b1000;
    #40 req = 4'b0000;

    #20 req = 4'b0110;
    #60 req = 4'b0000;
    #20 req = 4'b1001;
    #60 req = 4'b0000;
    #20 req = 4'b1010;
    #60 req = 4'b0000;
    #20 req = 4'b0111;
    #60 req = 4'b0000;

    #20 $finish;
  end

endmodule



