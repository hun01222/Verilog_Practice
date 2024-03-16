//This is for the SR flip flop module.

module sr_flip_flop_dataflow_module (s, r, clk, q, q_bar);
	input s, r;
	input clk; //clock
	
	output q, q_bar;
	
	wire q_tmp, q_bar_tmp;	

	assign q = (clk == 1'b1) ? !(r || q_bar) : q; 
	assign q_bar = (clk == 1'b1) ? !(s || q) : q_bar; 

endmodule
