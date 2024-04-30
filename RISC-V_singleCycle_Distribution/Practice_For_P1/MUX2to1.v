module MUX2to1
    #(parameter Width = 32)
(
    input  [Width-1:0] in0, in1,
    input              sel,
    output [Width-1:0] out
);
    assign out = (sel == 1'b0) ? in0 : in1;
endmodule