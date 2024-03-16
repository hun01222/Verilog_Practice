//This is for the 1:2 demux module.

module one_to_two_demux_behavioral_module (a, s, out1, out2);
	input a;
	input s;	
	output out1, out2;
	reg out1, out2;
	
	always@(a or s)
	begin
		if (s == 1'b0)
		begin
			if(a == 1'b0)
			begin
				out1 <= 1'b0;
				out2 <= 1'b0;
			end
			else
			begin
				out1 <= 1'b1;
				out2 <= 1'b0;
			end
		end
		else
		begin
			if(a == 1'b0)
			begin
				out1 <= 1'b0;
				out2 <= 1'b0;
			end
			else
			begin
				out1 <= 1'b0;
				out2 <= 1'b1;
			end
		end	
	end

endmodule
