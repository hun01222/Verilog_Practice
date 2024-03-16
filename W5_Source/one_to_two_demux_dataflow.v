
//This is for the 1:2 demux module.

module one_to_two_demux_dataflow_module (a, s, out1, out2);
	input a;
	input s;	
	output out1, out2;

	assign out1 = (a && !s);
	assign out2 = (a && s);

endmodule