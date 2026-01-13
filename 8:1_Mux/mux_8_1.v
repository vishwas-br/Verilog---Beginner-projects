module mux_8_1()
  input [2:0] sel;
  input in0, in1, in2, in3, in4, in5, in6, in7;
  output reg y;

  always @(*) begin
    case(sel)
      3'b000: y = in0;
      3'b001: y = in1;
      3'b010: y = in2;
      3'b011: y = in3;
      3'b100: y = in4;
      3'b101: y = in5;
      3'b110: y = in6;
      3'b111: y = in7;
      default: $display("Invalid sel input");
    endcase
  end
endmodule
