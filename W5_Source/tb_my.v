`timescale 1ns/1ns

module tb_my;
    reg A, B, C, D, S0, S1;
    
    wire OUT;

    integer cnt;

    four_to_one_mux_dataflow_module four_to_one_mux_dataflow(.a(A), .b(B), .c(C), .d(D), .s0(S0), .s1(S1), .out(OUT));
    four_to_one_mux_gatelevel_module four_to_one_mux_gatelevel(.a(A), .b(B), .c(C), .d(D), .s0(S0), .s1(S1), .out(OUT));
    four_to_one_mux_gatelevel_module four_to_one_mux_behavioral(.a(A), .b(B), .c(C), .d(D), .s0(S0), .s1(S1), .out(OUT));

    initial
    begin
        for (cnt = 0; cnt < 64; cnt = cnt + 1)
            #10 {S1, S0, A, B, C, D} = cnt;
    end

endmodule