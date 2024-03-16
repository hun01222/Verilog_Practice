//FSM example: Moore machine

module moore_machine_module(clk, in, rst, out, state, next_state);
	input clk, in, rst;
	
	output [1:0] out, state, next_state;
	reg	[1:0] out, state, next_state;
 
	//States
	parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;
		
	//Determine the output depending on the current state only 
	always @ (state) begin
		case (state)
			S0:	out = S1;
			S1:	out = S2;
			S2:	out = S3;
			S3:	out = S1;
			default: out = S0;
		endcase
	end
	
	//Update the current state
	always @ (posedge clk) 
	begin
		if (rst == 1'b1)
			state = S0;
		else
			state = next_state;
	end

	//Determine the next state
	always @ (posedge clk) 
	begin
		if (rst == 1'b1)
			next_state <= S0;
		else
		begin
			case (state)
				S0: 
				begin
					next_state <= S1;
				end
				S1:
				begin
					if (in == 1'b1)
						next_state <= S2;
					else
						next_state <= S1;
				end
				S2:
				begin
					if (in == 1'b1)
						next_state <= S3;
					else
						next_state <= S2;
				end
				S3:
				begin
					if (in == 1'b1)
						next_state <= S1;
					else
						next_state <= S3;
				end
			endcase
		end
	end
	
endmodule
