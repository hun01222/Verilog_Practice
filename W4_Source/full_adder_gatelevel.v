//This is for the 1-bit full adder module.

module full_adder_gatelevel_module (a, b, cin, sum, cout);
	input a, b, cin;
	output sum, cout;

	wire xor_out_1;
	wire xnor_out_1, xnor_out_2;
	wire not_out_1;

	wire and_out_1, and_out_2, and_out_3;
	wire or_out_1;

	//sum
	//Fill this out

	//cout
	and_gate and_1 (.a(a), .b(b), .out(and_out_1));
	and_gate and_2 (.a(b), .b(cin), .out(and_out_2));
	and_gate and_3 (.a(cin), .b(a), .out(and_out_3));
	or_gate_3 or_1 (.a(and_out_1), .b(and_out_2), .c(and_out_3), .out(or_out_1));
endmodule