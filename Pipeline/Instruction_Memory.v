`timescale 1ps/1ps

module Instruction_Memory (
    input      [31:0] PCF,
    output reg [31:0] instruction
);
    // reg [31:0] instructions_Value [31:0];   //maximum 32 instruction can be here
    reg [31:0] instructions_Value [255:0];  //maximum 256 instruction can be here

    initial begin
        instructions_Value[ 4] = 32'h002081B3; // add  x3, x1, x2		
        instructions_Value[ 8] = 32'h403202B3; // sub  x5, x4, x3        
	instructions_Value[12] = 32'h00308383; // lw   x7, 3(x1)
        instructions_Value[16] = 32'h0013F333; // and  x6, x7, x1
        instructions_Value[20] = 32'h001112B3; // sll  x5, x2, x1
        instructions_Value[24] = 32'h001122B3; // slt  x5, x2, x1
        instructions_Value[28] = 32'h00210463; // beq  x2, x2, 4
        instructions_Value[32] = 32'h001132B3; // sltu x5, x2, x1  // skipped by beq
        instructions_Value[36] = 32'h00322123; // sw x3 2(x4)
        instructions_Value[40] = 32'h001152B3; // srl  x5, x2, x1
        instructions_Value[44] = 32'h401152B3; // sra  x5, x2, x1
        instructions_Value[48] = 32'h008002EF; // jal  x5, 2       // will jump on
	instructions_Value[52] = 32'h00110293; // addi x5, x2, 1
        instructions_Value[56] = 32'h00312293; // slti x5, x2, 3
        instructions_Value[60] = 32'h00517293; // andi x5, x2, 5
        instructions_Value[64] = 32'h00211293; // slli x5, x2, 2
        instructions_Value[68] = 32'h002102E7; // jar  x5, x2, 2   // will jump on instruction 4
		
    end

    always @ (*) begin
		instruction = instructions_Value[PCF];  //instead, we can ignore the least 2 LSBs
    end

    
endmodule