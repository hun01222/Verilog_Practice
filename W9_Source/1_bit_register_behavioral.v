//This is a 1-bit register module.

module one_bit_register_behavioral_module(in, clk, rst, out);

	input in;
	input clk; //clock
	input rst; //reset
	
	output out;
	reg out;	
	
	always@(posedge clk)
	begin
		if(rst == 1'b1)
			out <= 1'b0; 
		else
		begin
			out <= in;
		end
	end



endmodule