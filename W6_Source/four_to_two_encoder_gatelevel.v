//This is for the 4:2 encoder module.

module four_to_two_encoder_gatelevel_module (a, b, c, d, out0, out1);
	input a, b, c, d;

	output out0, out1;
	
	or_gate or_1(.a(d), .b(b), .out(out0));
	or_gate or_2(.a(d), .b(c), .out(out1));

endmodule


