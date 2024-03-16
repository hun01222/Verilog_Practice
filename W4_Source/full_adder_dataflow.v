
//This is for the 1-bit full adder module.

module full_adder_dataflow_module (a, b, cin, sum, cout);
	input a, b, cin;
	output sum, cout;
	
	//sum
	assign sum = ((!a)&&b&&(!cin))||((!a)&&(!b)&&cin)||(a&&(!b)&&(!cin))||(a&&b&&cin);
	//cout
	assign cout = (a&&b)||(b&&cin)||(cin&&a);
	
endmodule