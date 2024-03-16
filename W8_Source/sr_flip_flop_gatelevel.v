//This is for the SR flip flop module.

module sr_flip_flop_gatelevel_module (s, r, clk, q, q_bar);
	input s, r;
	input clk; //clock
	
	output q, q_bar;
	
	wire and_1_output, and_2_output;
	wire or_1_output, or_2_output;
	

	and_gate and_1(.a(clk), .b(s), .out(and_1_output));
	and_gate and_2(.a(clk), .b(r), .out(and_2_output));
	
	or_gate or_1(.a(and_2_output), .b(q_bar), .out(or_1_output));
	not_gate not_1(.a(or_1_output), .out(q)); // These two lines are a NOR operation.
	
	or_gate or_2(.a(and_1_output), .b(q), .out(or_2_output));
	not_gate not_2(.a(or_2_output), .out(q_bar));
	
endmodule
