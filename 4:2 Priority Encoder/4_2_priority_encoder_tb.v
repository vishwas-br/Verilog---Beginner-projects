`timescale 1ns/1ps

module 4_2_priority_encoder_tb;
  reg [3:0] in;
  wire valid;
  wire [1:0] out;
  reg [1:0] expected_out;
  reg expected_valid;

  4_2_priority_encoder uut (.in(in), .out(out), .valid(valid));

  initial begin
        $display("Time\tin\t\tout\tvalid");
        $monitor("%0t\t%b\t%b\t%b", $time, in, out, valid);

        // Test 1: No input active
        in = 4'b0000; #10;
        expected_out   = 2'b00; 
        expected_valid = 1'b0;    
        if (out !== expected_out || valid !== expected_valid)
           $display("ERROR at time %0t: in=%b out=%b valid=%b", $time, in, out, valid);

        // Test 2: Single input active (lowest priority)
        in = 4'b0001; #10;
        expected_out   = 2'b00;  
        expected_valid = 1'b1;     
        if (out !== expected_out || valid !== expected_valid)
           $display("ERROR at time %0t: in=%b out=%b valid=%b", $time, in, out, valid);

        // Test 3: Single input active (middle priority)
        in = 4'b0100; #10;
        expected_out   = 2'b10;  
        expected_valid = 1'b1;   
        if (out !== expected_out || valid !== expected_valid)
           $display("ERROR at time %0t: in=%b out=%b valid=%b", $time, in, out, valid);

        // Test 4: Single input active (highest priority)
        in = 4'b1000; #10;
        expected_out   = 2'b11;  
        expected_valid = 1'b1;   
        if (out !== expected_out || valid !== expected_valid)
           $display("ERROR at time %0t: in=%b out=%b valid=%b", $time, in, out, valid);

        // Test 5: Multiple inputs active (in1 and in2)
        in = 4'b0110; #10;
        expected_out   = 2'b10;   
        expected_valid = 1'b1;     
        if (out !== expected_out || valid !== expected_valid)
           $display("ERROR at time %0t: in=%b out=%b valid=%b", $time, in, out, valid);

        // Test 6: Multiple inputs active (in3 and in0)
        in = 4'b1001; #10;
        expected_out   = 2'b11;   
        expected_valid = 1'b1;   
        if (out !== expected_out || valid !== expected_valid)
           $display("ERROR at time %0t: in=%b out=%b valid=%b", $time, in, out, valid);

        // Test 7: All inputs active
        in = 4'b1111; #10;
        expected_out   = 2'b11;  
        expected_valid = 1'b1;     
        if (out !== expected_out || valid !== expected_valid)
           $display("ERROR at time %0t: in=%b out=%b valid=%b", $time, in, out, valid);

        in = 4'b0010; #10;
        expected_out   = 2'b01;   
        expected_valid = 1'b1;     
        if (out !== expected_out || valid !== expected_valid)
           $display("ERROR at time %0t: in=%b out=%b valid=%b", $time, in, out, valid);

        $finish;
    end
endmodule
