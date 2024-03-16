//This is for the SR latch module.

module sr_latch_dataflow_module (s, r, q, q_bar);
	input s, r;

	output q, q_bar;
	
	wire q_tmp, q_bar_tmp;	

	assign q = !(r || q_bar); //This is a NOR operation.
	assign q_bar = !(s || q); //This is a NOR operation.

endmodule