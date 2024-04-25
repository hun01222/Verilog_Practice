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
        mem[ 0] = 32'b00010010001100100000001010000010; // 32'h12320282
    end
    assign instruction = mem[address];
endmodule
