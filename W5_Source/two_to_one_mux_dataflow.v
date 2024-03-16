//This is for the 2:1 mux module.

module two_to_one_mux_dataflow_module (a, b, s, out);
	input a, b;
	input s;	
	output out;
	
	assign out = (s == 1'b0)?a:b;

endmodule