//This is for the 1:4 demux module.

module one_to_four_demux_behavioral_module (a, s0, s1, out1, out2, out3, out4);
	input a;
	input s0, s1;	
	output out1, out2, out3, out4;
	reg out1, out2, out3, out4;
	
	always@(a or s0 or s1)
	begin
		case({s1, s0})
			2'b00 : {out1, out2, out3, out4} = {a, 3'b000};
			2'b01 : {out1, out2, out3, out4} = {1'b0, a, 2'b00};
			2'b10 : {out1, out2, out3, out4} = {2'b00, a, 1'b0};
			2'b11 : {out1, out2, out3, out4} = {3'b000, a};
		endcase
	end

endmodule