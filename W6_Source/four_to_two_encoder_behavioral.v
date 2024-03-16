//This is for the 4:2 encoder module.

module four_to_two_encoder_behavioral_module (a, b, c, d, out0, out1);
	input a, b, c, d;

	output out0, out1;
	reg out0, out1;
	
	always@(a or b or c or d)
	begin
		case({d, c, b, a})
			4'b0001 : begin out1 <= 1'b0; out0 <= 1'b0; end
			4'b0010 : begin out1 <= 1'b0; out0 <= 1'b1; end
			4'b0100 : begin out1 <= 1'b1; out0 <= 1'b0; end
			4'b1000 : begin out1 <= 1'b1; out0 <= 1'b1; end
		endcase
	end

endmodule
