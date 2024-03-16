module half_adder_behavioral_module (a, b, sum, carry);
	input a, b;
	output sum, carry;
	reg sum, carry;
	
	always@(a or b)
	begin
		{carry, sum} <= a + b;
	end

endmodule
