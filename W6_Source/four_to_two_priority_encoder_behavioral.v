//This is for the 4:2 priority encoder module.

module four_to_two_priority_encoder_behavioral_module (a, b, c, d, out0, out1);
	input a, b, c, d;

	output out0, out1;
	reg out0, out1;
	
	always@(a or b or c or d)
	begin
		case({d, c, b, a})
			4'b000x : begin out0 <= 1'b0; out1 <= 1'b0; end
			4'b001x : begin out0 <= 1'b1; out1 <= 1'b0; end
			4'b01xx : begin out0 <= 1'b0; out1 <= 1'b1; end
			4'b1xxx : begin out0 <= 1'b1; out1 <= 1'b1; end
		endcase
	end

endmodule