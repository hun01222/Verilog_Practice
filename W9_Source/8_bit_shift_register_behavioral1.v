//This is a 8-bit shift register module.

module eight_bit_shift_register_behavioral_module(shift_in, clk, rst, out);

	input shift_in;
	input clk; //clock
	input rst; //reset
	
	output [7:0] out;
	reg [7:0] out;	
	
	always@(posedge clk)
	begin
		if(rst == 1'b1)
		begin
			out <= 8'd0; //Take a look at it. I used the "decimal" format here.
		end
		else
		begin
			out <= {out[6:0], shift_in};
		end
	end



endmodule

