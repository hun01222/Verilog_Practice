`timescale 1ns/1ns

module tb_w10;
	
	//clock
	reg CLK;
	
	//////////////////////////////////
	//////////////////////////////////
	//////////////////////////////////
	//Simple counter
	//input 
	reg RESET_SIMPLE_COUNTER;
	
	//output
	wire [3:0] OUT_SIMPLE_COUNTER;	
	
	//////////////////////////////////
	//////////////////////////////////
	//////////////////////////////////
	//Up and down counter
	//input
	reg RESET_UPDOWN_COUNTER;
	reg MODE_UPDOWN_COUNTER;
	
	//output
	wire [3:0] OUT_UPDOWN_COUNTER;	
	
	//////////////////////////////////
	//////////////////////////////////
	//////////////////////////////////
	//Ripple counter
	//input
	reg RESET_RIPPLE_COUNTER;
	reg [3:0] PRESET_RIPPLE_COUNTER;
	
	//output
	wire [3:0] OUT_RIPPLE_COUNTER, OUT_RIPPLE_COUNTER2;	
	
	//////////////////////////////////
	//////////////////////////////////
	//////////////////////////////////
	//Ring counter
	//input
	reg RESET_RING_COUNTER;
	reg [3:0] PRESET_RING_COUNTER;
	
	//output
	wire [3:0] OUT_RING_COUNTER_B; //Behavioral modeling
	wire [3:0] OUT_RING_COUNTER_S; //Structural modeling

	//Module instantiation
	//Simple counter
	simple_counter_behavioral_module simple_counter_behavioral(.clk(CLK), .rst(RESET_SIMPLE_COUNTER), .out(OUT_SIMPLE_COUNTER));	
	
	//Up and down counter
	updown_counter_behavioral_module updown_counter_behavioral(.clk(CLK), .rst(RESET_UPDOWN_COUNTER), .mode(MODE_UPDOWN_COUNTER), .out(OUT_UPDOWN_COUNTER));
	
	//Ripple (up) counter
	ripple_counter_module ripple_counter(.clk(CLK), .rst(RESET_RIPPLE_COUNTER), .preset(PRESET_RIPPLE_COUNTER), .out(OUT_RIPPLE_COUNTER));
	ripple_counter2_module ripple_counter2(.clk(CLK), .rst(RESET_RIPPLE_COUNTER), .out(OUT_RIPPLE_COUNTER2));
	
	//Ring counter
	ring_counter_behavioral_module ring_counter_behavioral(.clk(CLK), .rst(RESET_RING_COUNTER), .out(OUT_RING_COUNTER_B));
	ring_counter_structural_module ring_counter_structural(.clk(CLK), .rst(RESET_RING_COUNTER), .preset(PRESET_RING_COUNTER), .out(OUT_RING_COUNTER_S));
	
	initial
	begin
		 CLK = 1'b0;
	     RESET_SIMPLE_COUNTER = 1'b1; 
		 RESET_UPDOWN_COUNTER = 1'b1;
		 RESET_RIPPLE_COUNTER = 1'b1;
		 PRESET_RIPPLE_COUNTER = 4'b0000;
		 RESET_RING_COUNTER = 1'b1; 
		 PRESET_RING_COUNTER = 4'b0001;
	end
	
	//clock
	initial
	begin
		 forever
		 begin
			#10 CLK = !CLK;
		 end
	end
	
	initial 
	begin	
		//test patterns 
		#20 RESET_SIMPLE_COUNTER = 1'b0; 
		    RESET_UPDOWN_COUNTER = 1'b0; MODE_UPDOWN_COUNTER = 1'b1;
			RESET_RIPPLE_COUNTER = 1'b0;
			RESET_RING_COUNTER = 1'b0;
			
			
		#400 RESET_SIMPLE_COUNTER = 1'b1; 
			 MODE_UPDOWN_COUNTER = 1'b0;
			 RESET_RIPPLE_COUNTER = 1'b1;
			 RESET_RING_COUNTER = 1'b1;
			 
		#400 RESET_UPDOWN_COUNTER = 1'b1;

	end
	
	
endmodule


