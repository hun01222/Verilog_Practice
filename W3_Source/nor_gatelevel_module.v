module nor_gatelevel_gate (a, b, out); 
	
	input a, b;

	output out;

	wire or_out;
	
	or_gate or_1 (.a(a), .b(b), .out(or_out));
	not_gate not_1 (.a(or_out), .out(out));
	
endmodule