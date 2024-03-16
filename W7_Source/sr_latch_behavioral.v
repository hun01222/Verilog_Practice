//This is for the SR latch module.

module sr_latch_behavioral_module (s, r, q, q_bar);
	input s, r;

	output q, q_bar;
	reg q, q_bar;
	
	always @ (s or r)
	begin
		case({s, r})
			2'b00: begin q <= q; q_bar <= q_bar; end
			2'b01: begin q <= 1'b0; q_bar <= 1'b1; end
			2'b10: begin q <= 1'b1; q_bar <= 1'b0; end
			2'b11: begin q <= 1'b0; q_bar <= 1'b0; end
		endcase
	end
endmodule



