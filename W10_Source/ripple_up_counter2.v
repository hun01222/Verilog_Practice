module ripple_counter2_module(clk, rst, preset, out);

    input clk;
	input rst;
	input [3:0] preset;
	
    output [3:0] out;	
	wire [3:0] out_bar;
	
	jk_flip_flop_behavioral_module jk_flip_flop_behavioral0(.j(1'b1), .k(1'b1), .clk(clk), .rst(rst), .q(out[0]), .q_bar(out_bar[0]));
	jk_flip_flop_behavioral_module jk_flip_flop_behavioral1(.j(1'b1), .k(1'b1), .clk(clk), .rst(rst), .q(out[1]), .q_bar(out_bar[1]));
	jk_flip_flop_behavioral_module jk_flip_flop_behavioral2(.j(1'b1), .k(1'b1), .clk(clk), .rst(rst), .q(out[2]), .q_bar(out_bar[2]));
	jk_flip_flop_behavioral_module jk_flip_flop_behavioral3(.j(1'b1), .k(1'b1), .clk(clk), .rst(rst), .q(out[3]), .q_bar(out_bar[3]));
	

endmodule

