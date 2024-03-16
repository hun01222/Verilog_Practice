//This is for the 2:1 mux module.

module two_to_one_mux_behavioral_module (a, b, s, out);
	input a, b;
	input s;	
	output out;
	reg out;
	
	always@(a or b or s)
	begin
		if (s == 1'b0)
			out <= a;
		else
			out <= b;
	end

endmodule