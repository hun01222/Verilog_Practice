//This is for the D latch module.

module d_latch_dataflow_module (d, en, q, q_bar);
	input d;
	input en; //enable

	output q, q_bar;
	
	assign q = (en == 1'b1) ? !(d||q_bar) : q;
	assign q_bar = (en == 1'b1) ? !(d||q) : q_bar;
	
endmodule
