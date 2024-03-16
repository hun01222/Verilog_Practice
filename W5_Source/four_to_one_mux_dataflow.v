//This is for the 4:1 mux module.

module four_to_one_mux_dataflow_module (a, b, c, d, s0, s1, out);
	input a, b, c, d;
	input s0, s1;	
	output out;
	
	assign out = ((!s0)&(!s1)?a:((s0)&(!s1)?b:((!s0)&(s1)?c:d)));

endmodule