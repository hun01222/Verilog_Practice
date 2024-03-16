//This is for the 4-bit full adder module.

module four_bit_full_adder_module (a, b, cin, sum, cout);
	input [3:0] a, b;
	input cin;
	output [3:0] sum;
	output cout;

	wire cout_1, cout_2, cout_3;

	full_adder_dataflow_module full_adder_dataflow_module_0 (.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(cout_1));
	full_adder_dataflow_module full_adder_dataflow_module_1 (.a(a[1]), .b(b[1]), .cin(cin), .sum(sum[1]), .cout(cout_2));
	full_adder_dataflow_module full_adder_dataflow_module_2 (.a(a[2]), .b(b[2]), .cin(cin), .sum(sum[2]), .cout(cout_3));
	full_adder_dataflow_module full_adder_dataflow_module_3 (.a(a[3]), .b(b[3]), .cin(cin), .sum(sum[3]), .cout(cout));

endmodule