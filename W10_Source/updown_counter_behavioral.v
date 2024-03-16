module updown_counter_behavioral_module(clk, rst, mode, out);

    input clk;
	input rst;
	input mode; //1 for up, 0 for down
	
    output [3:0] out;
	reg [3:0] out;

	initial 
		out <= 1'b0;
	
	always @ (posedge clk) 
	begin
		if(rst == 1'b1)
		begin
			out <= 1'b0;
		end
		else
		begin
			if(mode == 1'b1) //up
				out <= out + 1'b1;
			else
				out <= out - 1'b1;
		end		
	end

endmodule
