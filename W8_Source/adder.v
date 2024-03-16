module adder(a, b, carry_in, clk, sum, carry_out);

	input a, b, carry_in;
	input clk;
	output sum, carry_out;
	reg sum, carry_out;

	always @ (posedge clk)
	begin
		{carry_out, sum} <= a + b + carry_in;
	end

endmodule