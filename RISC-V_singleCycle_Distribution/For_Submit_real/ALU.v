module ALU
    #(parameter Width = 32)
(
    input [      3:0] control,
          [Width-1:0] operand1, operand2,
    output reg [Width-1:0] result,
    output zero
);
    always @(*) begin
        case (control)
            4'b0000: result = operand1 & operand2;
            4'b0001: result = operand1 | operand2;
            4'b0010: result = operand1 + operand2;
            4'b0110: result = operand1 - operand2;
            4'b0011: result = operand1 << operand2;
            4'b0100: result = ((~operand1+1) < (~operand2+1)) ? 1 : 0;
            4'b0101: result = (operand1 < operand2) ? 1 : 0;
            4'b0111: result = operand1 ^ operand2;
            4'b1100: result = {{{Width-5}{1'b0}}, operand2[14:10]} + {{{Width-5}{1'b0}}, operand2[9:5]} + {{{Width-5}{1'b0}}, operand2[4:0]}; // addi3
            4'b1001: result = operand1 * operand2;
            default: result = {Width{1'bx}};
        endcase
    end

    assign zero = (result == 0) ? 1 : 0;
endmodule