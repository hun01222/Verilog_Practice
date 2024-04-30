module MUX4to1_P2
    #(parameter Width = 32)
(
    input  [Width-1:0] in0, in1, in2,
    input  [      1:0] sel,
    output [Width-1:0] out
);
    assign out = (sel == 2'b10) ? in2 :(sel == 2'b01) ? in1 : (sel == 2'b00) ? in0 : 1'bx;
endmodule