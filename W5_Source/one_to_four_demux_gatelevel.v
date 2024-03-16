//This is for the 1:4 demux module.

module one_to_four_demux_gatelevel_module (a, s0, s1, out1, out2, out3, out4);
	input a;
	input s0, s1;	
	output out1, out2, out3, out4;

	wire not_1_output, not_2_output;
	wire and_1_output, and_3_output, and_5_output, and_7_output;

	not_gate not_1(s0, not_1_output);
	not_gate not_2(s1, not_2_output);

	and_gate and_1(not_1_output, not_2_output, and_1_output);
	and_gate and_2(and_1_output, a, out1);
	and_gate and_3(s0, not_2_output, and_3_output);
	and_gate and_4(and_3_output, a, out2);
	and_gate and_5(not_1_output, s1, and_5_output);
	and_gate and_6(and_5_output, a, out3);
	and_gate and_7(s0, s1, and_7_output);
	and_gate and_8(and_7_output, a, out4);
	
endmodule
