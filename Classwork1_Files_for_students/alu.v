module ALU #(parameter Width = 32)(control, operand1, operand2, out, clk);

	input [3:0] control;
	input [Width-1:0] operand1, operand2;
	input clk;
	
	output [Width-1:0] out;
	reg [Width-1:0] out;
	
	always @(posedge clk)
	begin
		case(control)
			4'b0001 : out <= operand1 + operand2;
			4'b0010 : out <= operand1 - operand2;
			4'b0011 : out <= operand1 ^ operand2;
			4'b0100 : out <= operand1 << 1;
		endcase
	end

endmodule

