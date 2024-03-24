module cpu #(parameter Width = 32)(instruction, out, clk);
	input clk;
	input [15:0] instruction;
	
	output [Width-1:0] out;
	
	wire [4:0] r1, r2;
	wire [Width-1:0] rd1, rd2;
	wire [3:0] control1;
	
	controller cont1(.opcode(instruction[5:0]), .control(control1), .clk(clk));
	Registerfile reg1(.R1(instruction[10:6]), .R2(instruction[15:11]), .RD1(rd1), .RD2(rd2), .clk(clk));
	ALU alu1(.control(control1), .operand1(rd1), .operand2(rd2), .out(out), .clk(clk));
	
endmodule