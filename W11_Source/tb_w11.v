`timescale 1ns/1ns

module tb_w11;
	
	//clock
	reg CLK;
	
	//////////////////////////////////
	//////////////////////////////////
	//////////////////////////////////
	//Moore Machine example
	//input 
	reg RESET_MOORE_EXAMPLE;	
	reg IN_MOORE_EXAMPLE;
		
	
	//output
	wire [1:0] OUT_MOORE_EXAMPLE;	
	wire [1:0] STATE_MOORE_EXAMPLE;
	wire [1:0] NEXT_STATE_MOORE_EXAMPLE;
	
	//////////////////////////////////
	//////////////////////////////////
	//////////////////////////////////
	//Mealy Machine example
	//input 
	reg RESET_MEALY_EXAMPLE;
	reg IN_MEALY_EXAMPLE;
		
	
	//output
	wire [1:0] OUT_MEALY_EXAMPLE;
	wire [1:0] STATE_MEALY_EXAMPLE;
	
	
	//////////////////////////////////
	//////////////////////////////////
	//////////////////////////////////
	//Counter (Homework)
	//Fill this out
	reg RESET_MOORE_COUNTER;
	reg IN_MOORE_COUNTER;

	wire [2:0] OUT_MOORE_COUNTER;
	wire [2:0] STATE_MOORE_COUNTER;
	wire [2:0] NEXT_STATE_MOORE_COUNTER;


	//Module instantiation
	//Moore Machine example
	moore_machine_module moore_machine_example(.clk(CLK), .in(IN_MOORE_EXAMPLE), .rst(RESET_MOORE_EXAMPLE), .out(OUT_MOORE_EXAMPLE), .state(STATE_MOORE_EXAMPLE), .next_state(NEXT_STATE_MOORE_EXAMPLE));
	
	//Mealy Machine example
	mealy_machine_module mealy_machine_example(.clk(CLK), .in(IN_MEALY_EXAMPLE), .rst(RESET_MEALY_EXAMPLE), .out(OUT_MEALY_EXAMPLE), .state(STATE_MEALY_EXAMPLE));
	
	//Counter (Homework)
	moore_counter_module moore_counter(.clk(CLK), .in(IN_MOORE_COUNTER), .rst(RESET_MOORE_COUNTER), .out(OUT_MOORE_COUNTER), .state(STATE_MOORE_COUNTER), .next_state(NEXT_STATE_MOORE_COUNTER));
	
	
	initial
	begin
		 CLK = 1'b0;
	     RESET_MOORE_EXAMPLE = 1'b1;
		 IN_MOORE_EXAMPLE  = 1'b0;
		 RESET_MEALY_EXAMPLE = 1'b1;
		 IN_MEALY_EXAMPLE  = 1'b0;
		 //Counter (Homework)
		 //Fill this out.
		 RESET_MOORE_COUNTER = 1'b1;
		 IN_MOORE_COUNTER = 1'b0;
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
		//Create a test pattern for the counter properly
		
		#20 RESET_MOORE_EXAMPLE = 1'b0;
			IN_MOORE_EXAMPLE  = 1'b1;
			RESET_MEALY_EXAMPLE = 1'b0;
			IN_MEALY_EXAMPLE  = 1'b1;
			RESET_MOORE_COUNTER = 1'b0;
			IN_MOORE_COUNTER = 1'b1;

		#100 IN_MOORE_COUNTER =1'b0;
			
		#300 IN_MEALY_EXAMPLE  = 1'b0;
			RESET_MOORE_EXAMPLE = 1'b1;
	end
	
	
endmodule




