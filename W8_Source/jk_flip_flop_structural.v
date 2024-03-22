module jk_flip_flop_structural_module (j, k, clk, q, q_bar);
  input j, k;
  input clk;

  output q, q_bar;
  reg q, q_bar;

  jk_flip_flop_behavioral_module jk_flip_flop_behavioral(.j(j), .k(k), .clk(clk), .q(q), .q_bar(q_bar));

endmodule