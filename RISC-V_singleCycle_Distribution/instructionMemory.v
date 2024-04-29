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
        mem[ 0] = 32'h05F00063; // 32'b00000101111100000000000001100011; // beq  x31,x0,32

        mem[ 4] = 32'h01DE8D33; // 32'b00000001110111101000110100110011; // add  x26,x29,x29
        mem[ 8] = 32'h01DD0D33; // 32'b00000001110111010000110100110011; // add  x26,x26,x29
        mem[12] = 32'h003D0D02; // addi3  x26,x26,3
        mem[16] = 32'h000F0D82; // addi3  x27,x30,0
        mem[20] = 32'h01BD0D33; // add  x26,x26,x27
        mem[24] = 32'h00CD8D82; // addi3  x27,x27,12
        mem[28] = 32'h000D0C03; // lw x24,0(x26)
        mem[32] = 32'h000D8C83; // lw x25,0(x27)
        mem[36] = 32'h039C1C33; // mul x24,x24,x25
        mem[40] = 32'h018F8FB3; // add  x31,x31,x24
        mem[44] = 32'h001F0F02; // addi3  x30,x30,1

        mem[48] = 32'h01EB8063; // beq  x30,x23,0
        mem[52] = 32'h000E8F87; // sw x31,0(x29)
        mem[56] = 32'h00000F82; // addi3  x31,x0,0
        mem[60] = 32'h00000F02; // addi3  x30,x0,0
        mem[64] = 32'h001E8E82; // addi3  x29,x29,1

        mem[68] = 32'h03DB8663; // beq  x29,x23,22

    end
    assign instruction = mem[address];
endmodule
