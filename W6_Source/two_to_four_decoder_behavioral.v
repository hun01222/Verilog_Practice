//This is for the 2:4 decoder module.

module two_to_four_decoder_behavioral_module (a, b, out0, out1, out2, out3);
	input a, b;

	output out0, out1, out2, out3;
	reg out0, out1, out2, out3;
	
	always@(a or b)
	begin
		case({b, a})
			2'b00 : begin out3 <= 1'b0; out2 <= 1'b0; out1 <= 1'b0; out0 <= 1'b1; end
			2'b01 : begin out3 <= 1'b0; out2 <= 1'b0; out1 <= 1'b1; out0 <= 1'b0; end
			2'b10 : begin out3 <= 1'b0; out2 <= 1'b1; out1 <= 1'b0; out0 <= 1'b0; end
			2'b11 : begin out3 <= 1'b1; out2 <= 1'b0; out1 <= 1'b0; out0 <= 1'b0; end
		endcase
	end

endmodule

