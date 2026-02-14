module alu_8bit (
    input  wire [7:0] A,
    input  wire [7:0] B,
    input  wire [3:0] opcode,   
    output reg  [7:0] result,
    output reg  zero,
    output reg  carry,
    output reg  negative
);

    always @(*) begin
        result = 8'h00;
        carry = 1'b0;
        negative = 1'b0;

        case (opcode)
            4'b0000: {carry, result} = A + B;   	      // ADD
            4'b0001: {carry, result} = A - B;   	      // SUB
            4'b0010: result = A & B;            	      // AND
            4'b0011: result = A | B;            	      // OR
            4'b0100: result = A ^ B;            	      // XOR
            4'b0101: result = ~A;               	      // NOT
            4'b0110: result = A << 1;           	      // Shift Left
            4'b0111: result = A >> 1;                   // Shift Right
            4'b1000: result = A + 1;                    // Increment
            4'b1001: result = A - 1;                    // Decrement
            4'b1010: result = (A == B) ? 8'h00 : 8'h01; // Compare
            4'b1011: result = A;                	      // Pass A
            4'b1100: result = B;                	      // Pass B
            4'b1101: result = ~(A & B);         	      // NAND
            4'b1110: result = ~(A | B);         	      // NOR
            4'b1111: result = ~(A ^ B);         	      // XNOR
            default: result = 8'h00;
        endcase

        zero = (result == 8'h00);
        negative = result[7]; 				// MSB indicates signed negative
    end

endmodule
