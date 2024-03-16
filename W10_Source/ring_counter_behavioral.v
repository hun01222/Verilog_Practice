
module ring_counter_behavioral_module(clk, rst, out);

    input clk;
	input rst;
	
    output [3:0] out;
	reg [3:0] out;
	
	always @ (posedge clk) 
	begin
		if(rst == 1'b1)
		begin
			out <= 4'b0001;
		end
		else
		begin
			if(out == 4'b0000) 
				out <= 4'b0001;
			else
				out <= out << 1;
				out [0] <= out[3];
		end		
	end

endmodule
