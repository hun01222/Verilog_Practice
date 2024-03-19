//This is for the D latch module.

module d_latch_sturctural_module (d, en, q, q_bar);
	input d;
	input en; //enable

	output q, q_bar;
	
	wire not_1_output;
	
	not_gate not_1(.a(d), .out(not_1_output));

	d_latch_structural_submodule d_latch_structural_submodule_1(.d(d), .en(en), .q(q), .q_bar(q_bar));
	d_latch_structural_submodule d_latch_structural_submodule_1(.d(not_1_output), .en(en), .q(q_bar), .q_bar(q));
	
endmodule

