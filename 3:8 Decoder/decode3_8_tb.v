`timescale 1ns/1ps

module decode3_8_tb;
    reg [2:0] in;
    reg en;
    wire [7:0] out;

    decode3_8 uut (.in(in), .en(en), .out(out));

    initial begin
        $monitor("Time=%0t en=%b in=%b out=%b", $time, en, in, out);

        // Test with enable=0
        en=0; 
        in = 3'b000; #10;
        in = 3'b111; #10;
        in = 3'b010; #10;
        in = 3'b101; #10;
        in = 3'b100; #10;
        in = 3'b110; #10;

        // Test with enable=1
        en=1;
        in = 3'b000; #10;
        in = 3'b001; #10;
        in = 3'b010; #10;
        in = 3'b011; #10;
        in = 3'b100; #10;
        in = 3'b101; #10;
        in = 3'b110; #10;
        in = 3'b111; #10;

        $finish;
    end
endmodule
