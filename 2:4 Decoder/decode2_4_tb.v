`timescale 1ns/1ps

module decode2_4_tb;
    reg [1:0] in;
    reg en;
    wire [3:0] out;

    decode2_4 uut (.in(in), .en(en), .out(out));

    initial begin
        $monitor("Time=%0t en=%b in=%b out=%b", $time, en, in, out);

        // Test with enable=0
        en=0; 
        in = 2'b00; #10;
        in = 2'b11; #10;
        in = 2'b01; #10;
        in = 2'b10; #10;
       
        // Test with enable=1
        en=1;
        in = 2'b00; #10;
        in = 2'b11; #10;
        in = 2'b01; #10;
        in = 2'b10; #10;
      
        $finish;
    end
endmodule
