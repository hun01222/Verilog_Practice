module ripple_counter_module(clk, rst, preset, out);

    input clk;
	input rst;
	input [3:0] preset;
	
    output [3:0] out;	
	wire [3:0] out_bar;
	
	d_flip_flop_behavioral_module d_flip_flop_behavioral0(.d(out_bar[0]), .clk(clk), .rst(rst), .preset(preset[0]), .q(out[0]), .q_bar(out_bar[0]));
	d_flip_flop_behavioral_module d_flip_flop_behavioral1(.d(out_bar[1]), .clk(out_bar[0]), .rst(rst), .preset(preset[1]),  .q(out[1]), .q_bar(out_bar[1]));
	d_flip_flop_behavioral_module d_flip_flop_behavioral2(.d(out_bar[2]), .clk(out_bar[1]), .rst(rst), .preset(preset[2]), .q(out[2]), .q_bar(out_bar[2]));
	d_flip_flop_behavioral_module d_flip_flop_behavioral3(.d(out_bar[3]), .clk(out_bar[2]), .rst(rst), .preset(preset[3]), .q(out[3]), .q_bar(out_bar[3]));
	

endmodule

