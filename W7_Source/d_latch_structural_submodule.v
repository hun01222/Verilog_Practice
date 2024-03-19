module d_latch_sturctural_submodule_module (d, en, q, q_bar);
  input d, q;
  input en;

  output q_bar;

  wire and_output;
  wire or_output;

  and_gate and(.a(en), .b(d), .out(and_output));

  or_gate or(.a(and_output), .b(q), .out(or_output));

  not_gate not(.a(or_output), .out(q_bar));

endmodule