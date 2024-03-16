module nor_behavioral_gate (a, b, out); 
	
	input a, b;

	output out;
	reg out;
	
	always @ (a or b)
	begin
		if(a == 1'b0 && b == 1'b0)
		begin
			out <= 1'b1;
		end
		else
		begin
			out <= 1'b0;
		end
	end

endmodule