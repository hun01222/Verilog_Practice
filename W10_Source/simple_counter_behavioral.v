module simple_counter_behavioral_module(clk, rst, out);

    input clk;
	input rst;
	
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
			out <= out + 1'b1;
		end
	end

endmodule
