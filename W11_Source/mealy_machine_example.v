//FSM example: Mealy machine

module mealy_machine_module(clk, in, rst, out, state);

	input clk, in, rst;
	
	output [1:0] out, state;
	reg	[1:0] out, state;
	
	//States
	parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;	
	
	//Determine the output depending on the current state as well as the incoming input 
	always @ (state or in)
	begin
		case (state)
			S0:
			begin
				if (in == 1'b1)
					out = S1;
				else
					out = S0;
			end
			S1:
			begin
				if (in == 1'b1)
					out = S2;
				else
					out = S1;
			end
			S2:
			begin
				if (in == 1'b1)
					out = S3;
				else
					out = S2;
			end
			S3:
			begin
				if (in == 1'b1)
					out = S1;
				else
					out = S3;
			end
		endcase
	end
	
	//Determine the next state
	always @ (posedge clk) begin
		if (rst == 1'b1)
			state <= S0;
		else
			case (state)
				S0:
				begin
					if (in == 1'b1)
						state <= S1;
					else
						state <= S0;
				end
				S1:
				begin
					if (in == 1'b1)
						state <= S2;
					else
						state <= S1;
				end
				S2:
				begin
					if (in == 1'b1)
						state <= S3;
					else
						state <= S2;
				end
				S3:
				begin
					if (in == 1'b1)
						state <= S1;
					else
						state <= S3;
				end
			endcase
	end

endmodule
