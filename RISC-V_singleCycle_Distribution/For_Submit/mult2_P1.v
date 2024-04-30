module mult2_P1
    #(parameter Width = 32)
(
    input  [Width-1:0] in,
    output [Width-1:0] out
);
    assign out = in << 1; // logical shift left by 1-bit
endmodule