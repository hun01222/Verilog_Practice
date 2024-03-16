//This is for the 4:1 mux module.

module four_to_one_mux_behavioral_module (a, b, c, d, s0, s1, out);
	input a, b, c, d;
	input s0, s1;	
	output out;
	reg out;
	
	always@(a or b or c or d or s0 or s1)
	begin
		case({s1, s0})
			2'b00 : out = a;
			2'b01 : out = b;
			2'b10 : out = c;
			2'b11 : out = d;
		endcase
	end

endmodule
