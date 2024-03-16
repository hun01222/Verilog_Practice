//This is for the 2:4 decoder module.

module two_to_four_decoder_dataflow_module (a, b, out0, out1, out2, out3);
	input a, b;

	output out0, out1, out2, out3;

	assign out0 = !a && !b;
	assign out1 = a && !b;
	assign out2 = !a && b;
	assign out3 = a && b;

endmodule

