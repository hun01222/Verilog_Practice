//This is for the D latch module.

module d_latch_behavioral_module (d, en, q, q_bar);
	input d;
	input en; //enable

	output q, q_bar;
	reg q, q_bar;
	
	always @ (d or en)
	begin
		//Fill this out.
	end
endmodule


