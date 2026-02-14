module alu_8bit_tb();
    reg [7:0] A;
    reg [7:0] B;
    reg [3:0] opcode;   
    wire [7:0] result;
    wire zero;
    wire carry;
    wire negative;
  
   alu_8bit uut(.A(A), .B(B), .opcode(opcode), .result(result), .zero(zero), .carry(carry), .negative(negative));
  
   task apply_test(input [7:0] a_val, input [7:0] b_val);
        integer i;
        begin
            A = a_val;
            B = b_val;
            for (i = 0; i < 16; i = i + 1) begin
                opcode = i[3:0];
                #5; 
                $display("Time=%0t | A=%h B=%h opcode=%b | result=%h | zero=%b carry=%b neg=%b", $time, A, B, opcode, result, zero, carry, negative);
            end
        end
    endtask

    initial begin
        apply_test(8'h0A, 8'h05);
	      apply_test(8'h03, 8'h02);
	      apply_test(8'h0F, 8'h01);
	      apply_test(8'h07, 8'h07);
        apply_test(8'hFF, 8'h01);
	      apply_test(8'h80, 8'h80);
	      apply_test(8'h00, 8'h01);
	      apply_test(8'hFF, 8'hFF);
        apply_test(8'h00, 8'h00);
        apply_test(8'h00, 8'hFF);      
        apply_test(8'h00, 8'h01);
        apply_test(8'h80, 8'h7F);
        apply_test(8'hAA, 8'h55);

        $finish;
    end

endmodule
