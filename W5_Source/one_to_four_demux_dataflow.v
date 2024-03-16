//This is for the 1:4 demux module.

module one_to_four_demux_dataflow_module (a, s0, s1, out1, out2, out3, out4);
	input a;
	input s0, s1;	
	output out1, out2, out3, out4;

	assign out1 = (!s0)&(!s1)?a:0;
	assign out2 = (s0)&(!s1)?a:0;
	assign out3 = (!s0)&(s1)?a:0;
	assign out4 = (s0)&(s1)?a:0;

endmodule
