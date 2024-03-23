module t_flip_flop_structural_module(t, clk, q, q_bar);
  input t;
  input clk;

  output q, q_bar;
  reg q, q_bar;
  wire and_1_output, and_2_output;

  and_gate and_1(.a(t), .b(q), .out(and_1_output));
  and_gate and_2(.a(t), .b(q_bar), .out(and_2_output));

  sr_flip_flop_behaviral sr_flip_flop_behaviral_module(.s(and_2_output), .r(and_1_output), .clk(clk), .q(q), .q_bar(q_bar));

endmodule