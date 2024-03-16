`timescale 1ns/1ns

module tb_w5;
	
	//2:1 MUX
	//input 
	reg A_2_TO_1, B_2_TO_1;
	
	//select (input)
	reg SEL_2_TO_1;
	
	//output
	wire OUTPUT_2_TO_1_B; //behavioral modeling
	wire OUTPUT_2_TO_1_D; //dataflow modeling
	wire OUTPUT_2_TO_1_G; //gatelevel modeling

		
	//////////////////////////////////
	//////////////////////////////////
	//////////////////////////////////
	//1:2 DEMUX
	//input 
	reg A_1_TO_2;

	//select (input)
	reg SEL_1_TO_2;
	
	//////////////////////////////////
	//////////////////////////////////
	//////////////////////////////////
	//4:1 MUX
	//select (input)
	reg SEL1_4_TO_1, SEL0_4_TO_1;
	
	//input 
	reg A_4_TO_1, B_4_TO_1, C_4_TO_1, D_4_TO_1;	
	
	//output
	wire OUTPUT_4_TO_1_B; //behavioral modeling
	wire OUTPUT_4_TO_1_D; //dataflow modeling
	wire OUTPUT_4_TO_1_G; //gatelevel modeling

	//////////////////////////////////
	//////////////////////////////////
	//////////////////////////////////
	//1:4 DEMUX
	//select (input)
	reg SEL1_1_TO_4, SEL0_1_TO_4;
	
	//input 
	reg A_1_TO_4;

	//output
	wire OUTPUT1_1_TO_4_B, OUTPUT2_1_TO_4_B, OUTPUT3_1_TO_4_B, OUTPUT4_1_TO_4_B; //behavioral modeling
	wire OUTPUT1_1_TO_4_D, OUTPUT2_1_TO_4_D, OUTPUT3_1_TO_4_D, OUTPUT4_1_TO_4_D; //dataflow modeling
	wire OUTPUT1_1_TO_4_G, OUTPUT2_1_TO_4_G, OUTPUT3_1_TO_4_G, OUTPUT4_1_TO_4_G; //gatelevel modeling	
	
	//temporal variable for loop
	integer count;

	//Module instantiation
	//2:1 MUX
	two_to_one_mux_behavioral_module two_to_one_mux_behavioral(.a(A_2_TO_1), .b(B_2_TO_1), .s(SEL_2_TO_1), .out(OUTPUT_2_TO_1_B));	
	two_to_one_mux_dataflow_module two_to_one_mux_dataflow(.a(A_2_TO_1), .b(B_2_TO_1), .s(SEL_2_TO_1), .out(OUTPUT_2_TO_1_D));
	two_to_one_mux_gatelevel_module two_to_one_mux_gatelevel(.a(A_2_TO_1), .b(B_2_TO_1), .s(SEL_2_TO_1), .out(OUTPUT_2_TO_1_G));

	//1:2 DEMUX
	one_to_two_demux_behavioral_module one_to_two_demux_behavioral(.a(A_1_TO_2), .s(SEL_1_TO_2), .out1(OUTPUT1_1_TO_2_B), .out2(OUTPUT2_1_TO_2_B));
	one_to_two_demux_dataflow_module one_to_two_demux_dataflow(.a(A_1_TO_2), .s(SEL_1_TO_2), .out1(OUTPUT1_1_TO_2_D), .out2(OUTPUT2_1_TO_2_D));
	one_to_two_demux_gatelevel_module one_to_two_demux_gatelevel(.a(A_1_TO_2), .s(SEL_1_TO_2), .out1(OUTPUT1_1_TO_2_G), .out2(OUTPUT2_1_TO_2_G));

	//4:1 MUX
	four_to_one_mux_behavioral_module four_to_one_mux_behavioral(.a(A_4_TO_1), .b(B_4_TO_1), .c(C_4_TO_1), .d(D_4_TO_1), .s0(SEL0_4_TO_1), .s1(SEL1_4_TO_1), .out(OUTPUT_4_TO_1_B));
	four_to_one_mux_dataflow_module four_to_one_mux_dataflow(.a(A_4_TO_1), .b(B_4_TO_1), .c(C_4_TO_1), .d(D_4_TO_1), .s0(SEL0_4_TO_1), .s1(SEL1_4_TO_1), .out(OUTPUT_4_TO_1_D));
	four_to_one_mux_gatelevel_module four_to_one_mux_gatelevel(.a(A_4_TO_1), .b(B_4_TO_1), .c(C_4_TO_1), .d(D_4_TO_1), .s0(SEL0_4_TO_1), .s1(SEL1_4_TO_1), .out(OUTPUT_4_TO_1_G));

	//1:4 DEMUX
	one_to_four_demux_behavioral_module one_to_four_demux_behavioral(.a(A_1_TO_4), .s0(SEL0_1_TO_4), .s1(SEL1_1_TO_4), .out1(OUTPUT1_1_TO_4_B), .out2(OUTPUT2_1_TO_4_B), .out3(OUTPUT3_1_TO_4_B), .out4(OUTPUT4_1_TO_4_B));
	one_to_four_demux_dataflow_module one_to_four_demux_dataflow(.a(A_1_TO_4), .s0(SEL0_1_TO_4), .s1(SEL1_1_TO_4), .out1(OUTPUT1_1_TO_4_D), .out2(OUTPUT2_1_TO_4_D), .out3(OUTPUT3_1_TO_4_D), .out4(OUTPUT4_1_TO_4_D));
	one_to_four_demux_gatelevel_module one_to_four_demux_gatelevel(.a(A_1_TO_4), .s0(SEL0_1_TO_4), .s1(SEL1_1_TO_4), .out1(OUTPUT1_1_TO_4_G), .out2(OUTPUT2_1_TO_4_G), .out3(OUTPUT3_1_TO_4_G), .out4(OUTPUT4_1_TO_4_G));
	
	initial
	begin
		 A_2_TO_1 = 1'b0; B_2_TO_1 = 1'b1; SEL_2_TO_1 = 1'b0; 
		 A_1_TO_2 = 1'b0; SEL_1_TO_2 = 1'b0;
		 A_4_TO_1 = 1'b0; B_4_TO_1 = 1'b0; C_4_TO_1 = 1'b0; D_4_TO_1 = 1'b0; SEL0_4_TO_1 = 1'b0; SEL1_4_TO_1 = 1'b0;
	end
	
	initial 
	begin	
		 
		 // Test pattern for 2:1 MUX
		A_2_TO_1 = 1'b0; B_2_TO_1 = 1'b0; SEL_2_TO_1 = 1'b0; 
		#10 A_2_TO_1 = 1'b0; B_2_TO_1 = 1'b0; SEL_2_TO_1 = 1'b1; 
		#10 A_2_TO_1 = 1'b0; B_2_TO_1 = 1'b1; SEL_2_TO_1 = 1'b0; 
		#10 A_2_TO_1 = 1'b0; B_2_TO_1 = 1'b1; SEL_2_TO_1 = 1'b1;
		#10 A_2_TO_1 = 1'b1; B_2_TO_1 = 1'b0; SEL_2_TO_1 = 1'b0; 
		#10 A_2_TO_1 = 1'b1; B_2_TO_1 = 1'b0; SEL_2_TO_1 = 1'b1; 
		#10 A_2_TO_1 = 1'b1; B_2_TO_1 = 1'b1; SEL_2_TO_1 = 1'b0; 
		#10 A_2_TO_1 = 1'b1; B_2_TO_1 = 1'b1; SEL_2_TO_1 = 1'b1;

		#90 //delay to border the test of 1:2 DEMUX		
		#10 A_1_TO_2 = 1'b0; SEL_1_TO_2 = 1'b1;
		#10 A_1_TO_2 = 1'b1; SEL_1_TO_2 = 1'b0;
		#10 A_1_TO_2 = 1'b1; SEL_1_TO_2 = 1'b1;
		
		#90 //delay to border the test of 4:1 MUX
		for (count = 0; count <64; count = count +1)
			#10 {SEL1_4_TO_1, SEL0_4_TO_1, A_4_TO_1, B_4_TO_1, C_4_TO_1, D_4_TO_1} = count;

		#90 //delay to border the test of 1:4 DEMUX
		for (count = 0; count <8; count = count +1)
			#10 {SEL1_1_TO_4, SEL0_1_TO_4, A_1_TO_4} = count;
	end
	
	
endmodule
