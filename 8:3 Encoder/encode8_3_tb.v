`timescale 1ns/1ps

module encode8_3_tb;
    reg [7:0] in;
    reg en;
    wire [2:0] out;

    encode8_3 uut (.in(in), .en(en), .out(out));

    initial begin
        $monitor("Time=%0t en=%b in=%b out=%b", $time, en, in, out);

        // Test with enable=0
        en=0; 
        in = 8'b00000001; #10;
        in = 8'b00000010; #10;
        in = 8'b00000100; #10;
        in = 8'b00001000; #10;
        in = 8'b00010000; #10;
        in = 8'b00100000; #10; 
        in = 8'b01000000; #10;
        in = 8'b10000000; #10;


        // Test with enable=1
        en=1;
        in = 8'b00000001; #10;
        in = 8'b00000010; #10;
        in = 8'b00000100; #10;
        in = 8'b00001000; #10;
        in = 8'b00010000; #10;
        in = 8'b00100000; #10; 
        in = 8'b01000000; #10;
        in = 8'b10000000; #10;
      

        $finish;
    end
endmodule

