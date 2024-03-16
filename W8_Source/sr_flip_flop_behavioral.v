//This is for the SR flip flop module.

module sr_flip_flop_behavioral_module (s, r, clk, q, q_bar);
	input s, r;
	input clk; //clock
	
	output q, q_bar;
	reg q, q_bar;

	always @ (posedge clk)
	begin
		case({s, r})
			2'b00: begin q <= q; q_bar <= q_bar; end
			2'b01: begin q <= 1'b0; q_bar <= 1'b1; end
			2'b10: begin q <= 1'b1; q_bar <= 1'b0; end
			2'b11: begin q <= 1'b0; q_bar <= 1'b0; end //Just a personal determination
			default: begin q <= 1'b0; q_bar <= 1'b1; end //It is an addition (which is not in the course slides). This line will make you easier to complete your homework.
		endcase
	end
endmodule




