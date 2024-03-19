//This is for the 4:2 priority encoder module.

module four_to_two_priority_encoder_gatelevel_module (a, b, c, d, out0, out1);
	input a, b, c, d;

	wire and_out;

	output out0, out1;
	
	and_gate and_1(.a(b), .b(c), .out(and_out));
	or_gate or_1(.a(and_out), .b(d), .out(out0));
	or_gate or_2(.a(c), .b(d), .out(out1));

endmodule
