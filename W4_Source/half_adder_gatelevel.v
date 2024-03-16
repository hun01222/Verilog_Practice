
module half_adder_gatelevel_module (a, b, sum, carry);
	input a, b;
	output sum, carry;
	wire xnor_out;
	
	xnor_gatelevel_gate xnor_1(.a(a), .b(b), .out(xnor_out));
	not_gate not_1(.a(xnor_out), .out(sum));
//	xor_gatelevel_gate xor_1(.a(a), .b(b), .out(sum));
	
	and_gate and_1(.a(a), .b(b), .out(carry));
	
endmodule