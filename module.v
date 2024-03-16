module adder(
    in_a, 
    in_b,
    out_sum
);
input        in_a;
input        in_b;
output [1:0] out_sum;

assign out_sum = in_a + in_b;

endmodule
