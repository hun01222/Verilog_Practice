module instructionMemory_P2
    #(parameter Width = 32)
(
    input  [Width-1:0] address,
    output [Width-1:0] instruction
);
    reg [9:0] cutAddress;
    reg [Width-1:0] mem[0:1023];

    initial begin
        mem[ 0] = 32'h52324082; // 32'b01 01001 00011 00100 100 00001 0000010; // 9+3+4, fun3, x1, opcode // 16 10000
        mem[ 4] = 32'h4433C102; // 32'b01 00010 00011 00111 100 00010 0000010; // 2+3+7, fun3, x2, opcode // 12 01100
        mem[ 8] = 32'h4221C182; // 32'b01 00001 00010 00011 100 00011 0000010; // 1+2+3, fun3, x3, opcode // 6  00110
    end
    assign instruction = mem[address];
endmodule
