module eight_bit_shift_register_structural_module(shift_in, clk, rst, out);

  input shift_in;
  input clk;
  input rst;

  output [7:0] out;
  reg [7:0] out;

  one_bit_register_behavioral_module one_bit_register_behavioral_1(.in(in[0]), .clk(clk), .rst(rst), .out(out[0]));

endmodule