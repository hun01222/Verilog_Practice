module adder_P1
    #(parameter Width = 32) 
(
    input  [Width-1:0] addend, adder,
    output [Width-1:0] result
);
    assign result = addend + adder;
endmodule