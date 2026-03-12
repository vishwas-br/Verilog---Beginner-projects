`timescale 1ns/1ps

module 8_3_priority_encoder_tb;
  reg [7:0] in;
  wire valid;
  wire [2:0] out;
  reg [2:0] expected_out;
  reg expected_valid;

  8_3_priority_encoder uut (.in(in), .out(out), .valid(valid));

  initial begin
      $display("Time\tin\t\tout\tvalid");
      $monitor("%0t\t%b\t%b\t%b", $time, in, out, valid);

      // Test 1: No input active
      in = 8'b00000000; #10;
      expected_out   = 3'b000;  
      expected_valid = 1'b0;     
        if (out !== expected_out || valid !== expected_valid)
           $display("ERROR at time %0t: in=%b out=%b valid=%b", $time, in, out, valid);

      // Test 2: Single input active (lowest priority)
      in = 8'b00000001; #10;
      expected_out   = 3'b000;  
      expected_valid = 1'b1;     
        if (out !== expected_out || valid !== expected_valid)
           $display("ERROR at time %0t: in=%b out=%b valid=%b", $time, in, out, valid);

      // Test 3: Single input active (middle priority)
      in = 8'b00001000; #10;
      expected_out   = 3'b011;  
      expected_valid = 1'b1;     
        if (out !== expected_out || valid !== expected_valid)
           $display("ERROR at time %0t: in=%b out=%b valid=%b", $time, in, out, valid);

      
      // Test 4: Single input active (highest priority)
      in = 8'b10000000; #10;
      expected_out   = 3'b111;  
      expected_valid = 1'b1;     
        if (out !== expected_out || valid !== expected_valid)
           $display("ERROR at time %0t: in=%b out=%b valid=%b", $time, in, out, valid);


      // Test 5: Multiple inputs active (in6 and in2)
      in = 8'b01000100; #10;
      expected_out   = 3'b110;  
      expected_valid = 1'b1;     
        if (out !== expected_out || valid !== expected_valid)
           $display("ERROR at time %0t: in=%b out=%b valid=%b", $time, in, out, valid);


      // Test 6: Multiple inputs active (in7 and in0)
      in = 8'b10000001; #10;
      expected_out   = 3'b111;  
      expected_valid = 1'b1;     
        if (out !== expected_out || valid !== expected_valid)
           $display("ERROR at time %0t: in=%b out=%b valid=%b", $time, in, out, valid);

      
      // Test 7: All inputs active
      in = 8'b11111111; #10;
      expected_out   = 3'b111;  
      expected_valid = 1'b1;     
        if (out !== expected_out || valid !== expected_valid)
           $display("ERROR at time %0t: in=%b out=%b valid=%b", $time, in, out, valid);

      $finish;
    end
endmodule



