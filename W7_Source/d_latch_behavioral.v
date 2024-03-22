//This is for the D latch module.

module d_latch_behavioral_module (d, en, q, q_bar);
	input d;
	input en; //enable

	output q, q_bar;
	reg q, q_bar;
	
	always @ (d or en)
	begin
		case({en, d})
			2'b0x: begin q <= q; q_bar <= q_bar; end
			2'b10: begin q <= 1'b0; q_bar <= 1'b1; end
			2'b11: begin q <= 1'b1; q_bar <= 1'b0; end
		endcase
	end
endmodule


