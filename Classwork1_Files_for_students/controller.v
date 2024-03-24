module controller(opcode, control, clk);
	input clk;	
	input [5:0] opcode;
	
	output [3:0] control;	
	reg [3:0] control;
	
	always @(posedge clk)
	begin
		case(opcode)
			6'b000001 : control <= 4'b0001; // add
			6'b000010 : control <= 4'b0010; // sub
			6'b000011 : control <= 4'b0011; // and
			6'b000100 : control <= 4'b0100; // sll
			default : 	control <= 4'b0000;
		endcase
	end
endmodule
