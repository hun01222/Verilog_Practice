//This is for the gated SR latch module.

module gated_sr_latch_behavioral_module (s, r, en, q, q_bar);
	input s, r;
	input en; // enable

	output q, q_bar;
	reg q, q_bar;
	
	always @ (en or s or r)
	begin
		case({en, s, r})
			3'b000: begin q <= q; q_bar <= q_bar; end
			3'b001: begin q <= q; q_bar <= q_bar; end
			3'b010: begin q <= q; q_bar <= q_bar; end
			3'b011: begin q <= q; q_bar <= q_bar; end
			3'b100: begin q <= q; q_bar <= q_bar; end
			3'b101: begin q <= 1'b0; q_bar <= 1'b1; end
			3'b110: begin q <= 1'b1; q_bar <= 1'b0; end
			3'b111: begin q <= 1'b0; q_bar <= 1'b0; end
		endcase
	end
endmodule




