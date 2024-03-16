
//This is a 8-bit shift register module.

module eight_bit_shift_register_behavioral2_module(shift_in, clk, rst, out);

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
			out[0] <= shift_in;
			out[1] <= out[0];
			out[2] <= out[1];
			out[3] <= out[2];
			out[4] <= out[3];
			out[5] <= out[4];
			out[6] <= out[5];
			out[7] <= out[6];	
		
		end
	end
endmodule