`timescale 1ps/1ps

module Instruction_Memory (
    input      [31:0] PCF,
    output reg [31:0] instruction
);
    // reg [31:0] instructions_Value [31:0];   //maximum 32 instruction can be here
    reg [31:0] instructions_Value [255:0];  //maximum 256 instruction can be here

    initial begin
        
        instructions_Value[ 0] = 32'h00000093; //  000000000000 00000 000 00001 0010011 // addi x1, x0, 0
        instructions_Value[ 4] = 32'h00100113; //  000000000001 00000 000 00010 0010011 // addi x2, x0, 1
        instructions_Value[ 8] = 32'h00F00193; //  000000001111 00000 000 00011 0010011 // addi x3, x0, 15
        instructions_Value[12] = 32'h00000513; // 000000000000 00000 000 01010 0010011 // addi x10, x0, 0
        instructions_Value[16] = 32'h06400213; // 000001100100 00000 000 00100 0010011 // addi x4, x0, 100
        // outer_loop
        instructions_Value[20] = 32'h04308263; // 0 000010 00011 00001 000 0010 0 1100011 // beq x1, x3, end_outer(88) -> 68
        instructions_Value[24] = 32'h00108113; // 000000000001 00001 000 00010 0010011 // addi x2, x1, 1
        // inner_loop
        instructions_Value[28] = 32'h02310863; // 0 000001 00011 00010 000 1000 0 1100011 // beq x2, x3, end_inner(76) -> 48
        instructions_Value[32] = 32'h00209293; // 000000000010 00001 001 00101 0010011 // slli x5, x1, 2
        instructions_Value[36] = 32'h005202B3; // 0000000 00101 00100 000 00101 0110011 // add x5, x5, x4
        instructions_Value[40] = 32'h00028303; // 000000000000 00101 000 00110 0000011 // lw   x6, 0(x5)
        instructions_Value[44] = 32'h00211393; // 000000000010 00010 001 00111 0010011 // slli x7, x2, 2 // 
        instructions_Value[48] = 32'h007203B3; // 0000000 00111 00100 000 00111 0110011 // add x7, x7, x4
        instructions_Value[52] = 32'h00038403; // 000000000000 00111 000 01000 0000011 // lw   x8, 0(x7)        
        instructions_Value[56] = 32'h00644663; // 0 000000 00110 01000 100 0110 0 1100011 // blt x6, x8, no_swap(68) -> 12
        instructions_Value[60] = 32'h0082A023; // 0000000 01000 00101 010 00000 0100011 // sw x8 0(x5)
        instructions_Value[64] = 32'h0063A023; // 0000000 00110 00111 010 00000 0100011 // sw x6 0(x7)
        // no_swap
        instructions_Value[68] = 32'h00110113; // 000000000001 00010 000 00010 0010011 // addi x2, x2, 1
        instructions_Value[72] = 32'hFD5FF06F; // 1 1111101010 1 11111111 00000 1101111 // jal  x0, inner_loop(28) -> -44 => 11111111 11111111 11111111 11010100
        // end_inner
        instructions_Value[76] = 32'h00108093; // 000000000001 00001 000 00001 0010011 // addi x1, x1, 1
        instructions_Value[80] = 32'hFC5FF06F; // 1 1111100010 1 11111111 00000 1101111 // jal  x0, outer_loop(20) -> -60 => 11111111 11111111 11111111 11000100
        
        /*
            3'b000:  ImmExtD = {{20{Imm[24]}}, Imm[24:13]};                            // I type
            3'b001:  ImmExtD = {{20{Imm[24]}}, Imm[24:18], Imm[4:0]};                  // S type (stores)
            3'b010:  ImmExtD = {{20{Imm[24]}}, Imm[0],  Imm[23:18], Imm[4:1], 1'b0};   // B type (branches)
            3'b011:  ImmExtD = {{12{Imm[24]}}, Imm[12:5],  Imm[13], Imm[23:14], 1'b0}; // J type (branches)
        */
        
        //The Test Case of mine
        /*
        instructions_Value[ 0] = 32'h000181B3; // 000000000000 00011 000 00011 0110011 // addi x3, x3, 0
        instructions_Value[ 4] = 32'h0011CA63; // 0 000000 00001 00011 100 1010 0 1100011 // blt  x1, x3, 24 -> 20
	    instructions_Value[ 8] = 32'h00108093; // 000000000001 00001 000 00001 0110011 // addi x1, x1, 1
        instructions_Value[12] = 32'h00110113; // 000000000001 00010 000 00010 0110011 // addi x2, x2, 1
        instructions_Value[16] = 32'h00110113; // 000000000001 00010 000 00010 0110011 // addi x2, x2, 1
        instructions_Value[20] = 32'h00110113; // 000000000001 00010 000 00010 0110011 // addi x2, x2, 1
        instructions_Value[24] = 32'h00110113; // 000000000001 00010 000 00010 0110011 // addi x2, x2, 1
        instructions_Value[28] = 32'h00110113; // 000000000001 00010 000 00010 0110011 // addi x2, x2, 1
        instructions_Value[32] = 32'hFE5FF06F; // 1 1111110010 1 11111111 00000 1101111 // jal  x0, 4 -> -28 => 11111111 11111111 11111111 11100100
        instructions_Value[36] = 32'h00110113; // 000000000001 00010 000 00010 0110011 // addi x2, x2, 1
        instructions_Value[40] = 32'h00110113; // 000000000001 00010 000 00010 0110011 // addi x2, x2, 1
        */

        // Given Test Case
        /*
        instructions_Value[ 4] = 32'h002081B3; // add  x3, x1, x2 // 
        instructions_Value[ 8] = 32'h403202B3; // sub  x5, x4, x3        
	    instructions_Value[12] = 32'h00308383; // lw   x7, 3(x1) // 00000000001100001000001110000011
        instructions_Value[16] = 32'h0013F333; // and  x6, x7, x1
        instructions_Value[20] = 32'h001112B3; // sll  x5, x2, x1
        instructions_Value[24] = 32'h001122B3; // slt  x5, x2, x1
        instructions_Value[28] = 32'h00210463; // 0 000000 00010 00010 000 0100 0 1100011 // beq  x2, x2, 4 -> -24
        instructions_Value[32] = 32'h001132B3; // sltu x5, x2, x1  // skipped by beq
        instructions_Value[36] = 32'h00322123; // sw x3 2(x4)
        instructions_Value[40] = 32'h001152B3; // srl  x5, x2, x1
        instructions_Value[44] = 32'h401152B3; // sra  x5, x2, x1
        instructions_Value[48] = 32'h008002EF; // 0 0000000100 0 00000000 00101 1101111 // jal  x5, 2       // will jump on
	    instructions_Value[52] = 32'h00110293; // addi x5, x2, 1
        instructions_Value[56] = 32'h00312293; // slti x5, x2, 3
        instructions_Value[60] = 32'h00517293; // andi x5, x2, 5
        instructions_Value[64] = 32'h00211293; // slli x5, x2, 2
        instructions_Value[68] = 32'h002102E7; // 0 0000000001 0 00010000 00101 1100111 // jar  x5, x2, 2   // will jump on instruction 4
        */
    end

    always @ (*) begin
		instruction = instructions_Value[PCF];  //instead, we can ignore the least 2 LSBs ??
    end

    
endmodule