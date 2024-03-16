//This is for the D flip flop module.

module d_flip_flop_behavioral_module (d, clk, q, q_bar);
	input d;
	input clk; // clock

	output q, q_bar;
	reg q, q_bar;
	
	always @ (posedge clk)
	begin
		q <= d;
		q_bar <= !d;
	end
endmodule
