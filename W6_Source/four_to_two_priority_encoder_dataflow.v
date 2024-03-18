//This is for the 4:2 priority encoder module.

module four_to_two_priority_encoder_dataflow_module (a, b, c, d, out0, out1);
	input a, b, c, d;

	output out0, out1;

	assign out0 = ((b == 1'b1)&&(c == 1'b0)) || (d == 1'b1);
	assign out1 = (c == 1'b1) || (d == 1'b1);

endmodule


