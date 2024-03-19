//This is for the D latch module.

module d_latch_gatelevel_module (d, en, q, q_bar);
	input d;
	input en; //enable

	output q, q_bar;
	
	wire not_1_output;
	wire and_1_output, and_2_output;
	wire or_1_output, or_2_output;
	
	not_gate not_1(.a(d), .out(not_1_output));

	and_gate and_1(.a(en), .b(d), .out(and_1_output));
	and_gate and_2(.a(en), .b(not_1_output), .out(and_2_output));
	
	or_gate or_1(.a(and_1_output), .b(and_2_output), .out(or_1_output));
	or_gate or_2(.a(and_2_output), .b(and_1_output), .out(or_2_output));

	not_gate not_2(.a(or_1_output), .out(q_bar));
	not_gate not_3(.a(or_2_output), .out(q));

endmodule
