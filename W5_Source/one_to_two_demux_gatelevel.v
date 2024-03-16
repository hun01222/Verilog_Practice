
//This is for the 1:2 demux module.

module one_to_two_demux_gatelevel_module (a, s, out1, out2);
	input a;
	input s;	
	output out1, out2;
	
	wire not_1_output;
	
	not_gate not_1(.a(s), .out(not_1_output));
	and_gate and_1(.a(a), .b(not_1_output), .out(out1));
	and_gate and_2(.a(a), .b(s), .out(out2));

endmodule
