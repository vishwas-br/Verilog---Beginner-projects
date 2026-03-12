`timescale 1ns/1ps

module encode4_2_tb;
    reg [3:0] in;
    reg en;
    wire [1:0] out;

    encode4_2 uut (.in(in), .en(en), .out(out));

    initial begin
        $monitor("Time=%0t en=%b in=%b out=%b", $time, en, in, out);

        // Test with enable=0
        en=0; 
        in = 4'b0010; #10;
        in = 4'b0001; #10;
        in = 4'b0100; #10;
        in = 4'b1000; #10;
       
        // Test with enable=1
        en=1;
        in = 4'b0010; #10;
        in = 4'b0001; #10;
        in = 4'b0100; #10;
        in = 4'b1000; #10;
       
        $finish;
    end
endmodule
