//This is for the 1-bit full adder module.

module full_adder_behavioral_module (a, b, cin, sum, cout);
	input a, b, cin;
	output sum, cout;
	reg sum, cout;
	
	always@(a or b or cin)
	begin
		{cout, sum} <= a + b + cin;
	end

endmodule