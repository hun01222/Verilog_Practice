
//This is for the 2:4 decoder module.

module two_to_four_decoder_gatelevel_module (a, b, out0, out1, out2, out3);
	input a, b;

	output out0, out1, out2, out3;
	
	wire not_1_output, not_2_output;
	
	not_gate not_1(.a(a), .out(not_1_output));
	not_gate not_2(.a(b), .out(not_2_output));
	
	and_gate and_1(.a(not_1_output), .b(not_2_output), .out(out0));
	and_gate and_2(.a(a), .b(not_2_output), .out(out1));
	and_gate and_3(.a(not_1_output), .b(b), .out(out2));
	and_gate and_4(.a(a), .b(b), .out(out3));

endmodule

