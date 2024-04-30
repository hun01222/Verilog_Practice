/*
//instmem에서
mem[n] = 32'b00 01001 00011 00100 000 00101 0000010;
//                9  +  3  +  4,  fun3, x5, opcode (새로 정의)

//mainCtrl에서
7'b0000010 : control = 10'b1010000011;

//ALUCtrl에서
2'b11 : case({1'b0, funct3})
    4'b0000 : control <= 4'b1000;
endcase

//immGen에서
case(in[6:0])
  7'b0000010 : out = {{{Width-15}{1'b0}}, in[29:15]};
endcase

//ALU에서
case(control)
  4'b1000: result = {{{Width-5}{1'b0}}, operand2[14:10]} + {{{Width-5}{1'b0}}, operand2[9:5]} + {{{Width-5}{1'b0}}, operand2[4:0]};
endcase
*/