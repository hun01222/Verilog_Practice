//This is for the 4:2 priority encoder module.

module four_to_two_priority_encoder_gatelevel_module (a, b, c, d, out0, out1);
	input a, b, c, d;

	wire and_out;

	output out0, out1;
	
	and_gate and_1(b, c, and_out);
	or_gate or_1(and_out, d, out0);
	or_gate or_2(c, d, out1);

endmodule
