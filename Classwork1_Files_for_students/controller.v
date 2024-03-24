module controller(opcode, control, clk);
	input clk;	
	input [5:0] opcode;
	
	output [3:0] control;	
	reg [3:0] control;
	
	always @(posedge clk)
	begin
		case(opcode)
			//Fill this out
			default : 	control <= 4'b0000;
		endcase
	end
endmodule
