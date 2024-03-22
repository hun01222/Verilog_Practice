module eight_bit_register_structural_module(in, clk, rst, out);

  input [7:0] in;
  input clk;
  input rst;

  output [7:0] out;
  reg [7:0] out;

  one_bit_register_behavioral_module one_bit_register_behavioral_1(.in(in[0]), .clk(clk), .rst(rst), .out(out[0]));
  one_bit_register_behavioral_module one_bit_register_behavioral_2(.in(in[1]), .clk(clk), .rst(rst), .out(out[1]));
  one_bit_register_behavioral_module one_bit_register_behavioral_3(.in(in[2]), .clk(clk), .rst(rst), .out(out[2]));
  one_bit_register_behavioral_module one_bit_register_behavioral_4(.in(in[3]), .clk(clk), .rst(rst), .out(out[3]));
  one_bit_register_behavioral_module one_bit_register_behavioral_5(.in(in[4]), .clk(clk), .rst(rst), .out(out[4]));
  one_bit_register_behavioral_module one_bit_register_behavioral_6(.in(in[5]), .clk(clk), .rst(rst), .out(out[5]));
  one_bit_register_behavioral_module one_bit_register_behavioral_7(.in(in[6]), .clk(clk), .rst(rst), .out(out[6]));
  one_bit_register_behavioral_module one_bit_register_behavioral_8(.in(in[7]), .clk(clk), .rst(rst), .out(out[7]));

endmodule