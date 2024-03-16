//This is for the SR latch module.

module sr_latch_gatelevel_module (s, r, q, q_bar);
	input s, r;

	output q, q_bar;
	
	wire or_1_output, or_2_output;
	
	or_gate or_1(.a(r), .b(q_bar), .out(or_1_output));
	not_gate not_1(.a(or_1_output), .out(q)); // These two lines are a NOR operation.
	
	or_gate or_2(.a(s), .b(q), .out(or_2_output));
	not_gate not_2(.a(or_2_output), .out(q_bar));
	
endmodule