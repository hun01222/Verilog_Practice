
module d_flip_flop_structural_module (d, clk, q, q_bar);
	input d;
	input clk; // clock

	output q, q_bar;
	
	wire not_1_output;
	
	not_gate not_1(.a(d), .out(not_1_output));
	
	sr_flip_flop_behavioral_module sr_flip_flop_behavioral(.s(d), .r(not_1_output), .clk(clk), .q(q), .q_bar(q_bar));
	
endmodule

