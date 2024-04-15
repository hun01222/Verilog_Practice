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
        mem[ 0] = 32'h002081B3; // add  x3, x1, x2
        mem[ 4] = 32'h403202B3; // sub  x5, x4, x3
        mem[ 8] = 32'h00308383; // lw   x7, 3(x1)
        mem[12] = 32'h0013F333; // and  x6, x7, x1
        mem[16] = 32'h001112B3; // sll  x5, x2, x1
        mem[20] = 32'h001122B3; // slt  x5, x2, x1
        mem[24] = 32'h00210463; // beq  x2, x2, 4
        mem[28] = 32'h001132B3; // sltu x5, x2, x1  // skipped by beq
    end
    assign instruction = mem[address];
endmodule
