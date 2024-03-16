//This is for the gated SR latch module.

module gated_sr_latch_dataflow_module (s, r, en, q, q_bar);
	input s, r;
	input en; //enable
	
	output q, q_bar;
	
	wire q_tmp, q_bar_tmp;	

	assign q = (en == 1'b1)? !(r || q_bar) : q;
	assign q_bar = (en == 1'b1)? !(s || q): q_bar;
	
endmodule
