//This is for the D latch module.

module d_latch_sturctural_module (d, en, q, q_bar);
	input d;
	input en; //enable

	output q, q_bar;
	
	wire not_1_output;
	
	not_gate not_1(.a(d), .out(not_1_output));

	gated_sr_latch_behavioral_module gated_sr_latch_behavioral(.s(d), .r(not_1_output), .en(en), .q(q), .q_bar(q_bar));
	
endmodule

