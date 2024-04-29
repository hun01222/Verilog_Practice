module instructionMemory
    #(parameter Width = 32)
(
    input  [Width-1:0] address,
    output [Width-1:0] instruction
);
    reg [9:0] cutAddress;
    reg [Width-1:0] mem[0:1023]; // 2차원 배열인듯, 크기 4Kbyte, 일반 register와 reg와 다름 wire reg 차이, reg type이 이전 state 값을 보존 = sequential
    // sequential, comb 엄격히 구분, input timing의 문제

    initial begin
        // for Problem 2
        // mem[ 0] = 32'h12320282; // 32'b0001 0010 0011 00100 000 00101 0000010 // 1, 2, 3, x4, fun3, x5, opcode
        // mem[ 4] = 32'h34508202; // 32'b0011 0100 0101 00001 000 00100 0000010 // 3, 4, 5, x1, fun3, x4, opcode
        // mem[ 8] = 32'h31120282; // 32'b0011 0001 0001 00100 000 00101 0000010 // 3, 1, 1, x1, fun3, x5, opcode

        // for Problem 3
        mem[ 0] = 32'h05FB8263; // 32'b0 000010 11111 10111 000 0010 0 1100011; // beq  x31,x23,34

        mem[ 4] = 32'h01DE8D33; // 32'b0000000 11101 11101 000 11010 0110011 // add  x26,x29,x29
        mem[ 8] = 32'h01DD0D33; // 32'b0000000 11101 11010 000 11010 0110011 // add  x26,x26,x29
        mem[12] = 32'h017D0D02; // 32'b0000000 10111 11010 000 11010 0000010 // add  x26,x26,x23
        mem[16] = 32'h000F0D82; // 32'b0000000 00000 11110 000 11011 0000010 // add  x27,x30,x0
        mem[20] = 32'h01BD0D33; // 32'b0000000 11011 11010 000 11010 0110011 // add  x26,x26,x27
        mem[24] = 32'h016D8D82; // 32'b0000000 10110 11011 000 11011 0000010 // add  x27,x27,x22
        mem[28] = 32'h000D0C03; // 32'b000000000000 11010 000 11000 0000011 // lw x24,0(x26)
        mem[32] = 32'h000D8C83; // 32'b000000000000 11011 000 11001 0000011 // lw x25,0(x27)
        mem[36] = 32'h039C1C33; // 32'b0000001 11001 11000 001 11000 0110011 // mul x24,x24,x25
        mem[40] = 32'h018F8FB3; // 32'b0000000 11000 11111 000 11111 0110011 // add  x31,x31,x24
        mem[44] = 32'h015F0F02; // 32'b0000000 10101 11110 000 11110 0000010 // add  x30,x30,x21

        mem[48] = 32'h01EB8263; // 32'b0 000000 11110 10111 000 0010 0 1100011 // beq  x30,x23,0
        mem[52] = 32'h01FE8007; // 32'b0000000 11111 11101 000 00000 0000111 // sw x29,0(x31)
        mem[56] = 32'h00000F82; // 32'b0000000 00000 00000 000 11111 0000010 // add  x31,x0,x0
        mem[60] = 32'h00000F02; // 32'b0000000 00000 00000 000 11110 0000010 // add  x30,x0,x0
        mem[64] = 32'h015E8E82; // 32'b0000000 10101 11101 000 11101 0000010 // add  x29,x29,x21

        mem[68] = 32'h03DB8863; // 32'b0 000001 11101 10111 000 1000 0 1100011 // beq  x29,x23,24

    end
    assign instruction = mem[address];
endmodule
