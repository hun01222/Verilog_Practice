module mainController_P1
(
    input  [6:0] opCode,
    output ALUSrc, memToReg, regWrite, memRead, memWrite, branch, jal, jalr,
           [1:0] ALUOp
);
    reg [9:0] control;
    assign {ALUSrc, memToReg, regWrite, memRead, memWrite, branch, jal, jalr, ALUOp} = control;
    
    always @(*) begin
        case(opCode) // ALU Control 파일 가서 확인할 것
            7'b0110011 : control = 10'b0010000010; // R-type // congatination
            7'b0000011 : control = 10'b1111000000; // lw (I-type)
            7'b0000111 : control = 10'b1000100000; // sw
            7'b1100011 : control = 10'b0x00010001; // branch (sb-type)    
            7'b0000010 : control = 10'b1010000011; // addi3
            default    : control = 10'bxxxxxxxxxx; // case x 라는걸 써야된다고 함
        endcase
    end
endmodule