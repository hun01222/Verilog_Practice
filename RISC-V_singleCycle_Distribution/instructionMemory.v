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
        mem[ 0] = 32'h12320282; // 32'b0001 0010 0011 00100 000 00101 0000010 // 1, 2, 3, x4, fun3, x5, opcode
        mem[ 4] = 32'h34508202; // 32'b0011 0100 0101 00001 000 00100 0000010 // 3, 4, 5, x1, fun3, x4, opcode
        mem[ 8] = 32'h31120282; // 32'b0011 0001 0001 00100 000 00101 0000010 // 3, 1, 1, x1, fun3, x5, opcode
    end
    assign instruction = mem[address];
endmodule
