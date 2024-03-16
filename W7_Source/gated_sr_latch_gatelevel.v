//This is for the gated SR latch module.

module gated_sr_latch_gatelevel_module (s, r, en, q, q_bar);
	input s, r;
	input en; //enable

	output q, q_bar;
	
	wire and_1_output, and_2_output;
	wire or_1_output, or_2_output;
	
	and_gate and_1(.a(en), .b(r), .out(and_1_output));
	and_gate and_2(.a(en), .b(s), .out(and_2_output));
		
	or_gate or_2(.a(q), .b(and_2_output), .out(or_2_output));
	not_gate not_2(.a(or_2_output), .out(q_bar)); // These two lines are a NOR operation.
	
	or_gate or_1(.a(q_bar), .b(and_1_output), .out(or_1_output));
	not_gate not_1(.a(or_1_output), .out(q));	
	
endmodule
