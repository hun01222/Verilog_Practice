
//instmem에서
mem[n] = 32'b0001 0010 0011 00100 000 00101 0000010;
//            1 + 2 + 3 + x4, fun3, x5, opcode (새로 정의)

//mainCtrl에서
7'b0000010 : control = 10'b1010000011;

//ALUCtrl에서
2'b11 : case({1'b0, funct3})
    4'b0000 : control <= 4'b1000;
endcase

//immGen에서
case(in[6:0])
  7'b0000010 : out = {{{Width-12}{1'b0}}, in[31:20]};
endcase

//ALU에서
case(control)
  4'b1000: result = operand1 + {{{Width-4}{1'b0}}, operand2[11:8]} + {{{Width-4}{1'b0}}, operand2[7:4]} + {{{Width-4}{1'b0}}, operand2[3:0]};
endcase
