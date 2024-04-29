module ALUControl
(
    input [1:0] ALUOp,
    input funct7_30, [2:0] funct3,
    output reg [3:0] control
);

    always @(*) begin
        case (ALUOp)
            2'b00 : control <= 4'b0010;       // addition for ld, sw, jal and jalr
            2'b01 : control <= 4'b1110;       // subtraction for beq
            2'b10 : case({funct7_30,funct3})
                4'b0000 : control <= 4'b0010; // add
                4'b1000 : control <= 4'b0110; // sub
                4'b0111 : control <= 4'b0000; // and
                4'b0110 : control <= 4'b0001; // or
                4'b0001 : control <= 4'b0011; // sll  (shift left logical)
                4'b0010 : control <= 4'b0100; // slt  (set less than)
                4'b0011 : control <= 4'b0101; // sltu (set less than unsigned)
                4'b0100 : control <= 4'b0111; // xor
                4'b1001 : control <= 4'b1001; // mul
                default : control <= 4'bxxxx;
            endcase
            2'b11 : case({1'b0,funct3})     // immediate instructions
                4'b0000 : control <= 4'b1000; // addi3
                default : control <= 4'bxxxx;
            endcase
        endcase
    end
endmodule