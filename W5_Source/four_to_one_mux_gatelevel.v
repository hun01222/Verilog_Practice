//This is for the 4:1 mux module.

module four_to_one_mux_gatelevel_module (a, b, c, d, s0, s1, out);
	input a, b, c, d;
	input s0, s1;	
	output out;
	
	wire not_1_output, not_2_output;
	wire and_1_output, and_2_output, and_3_output, and_4_output,
	     and_5_output, and_6_output, and_7_output, and_8_output;
	wire or_1_output, or_2_output;
	
	not_gate not_1 (s0, not_1_output);
	not_gate not_2 (s1, not_2_output);

	and_gate and_1 (not_1_output, not_2_output, and_1_output);
	and_gate and_2 (s0, not_2_output, and_2_output);
	and_gate and_3 (not_1_output, s1, and_3_output);
	and_gate and_4 (s0, s1, and_4_output);
	and_gate and_5 (and_1_output, a, and_5_output);
	and_gate and_6 (and_2_output, b, and_6_output);
	and_gate and_7 (and_3_output, c, and_7_output);
	and_gate and_8 (and_4_output, d, and_8_output);

	or_gate or_1 (and_5_output, and_6_output, or_1_output);
	or_gate or_2 (and_7_output, and_8_output, or_2_output);
	or_gate or_3 (or_1_output, or_2_output, out);

endmodule
