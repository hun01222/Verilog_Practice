`timescale 1ns/1ns

module tb_w8;
	
	//clock
	reg CLK;
	
	//////////////////////////////////
	//////////////////////////////////
	//////////////////////////////////
	//SR flip flop
	//input 
	reg S, R;
	
	//output
	wire Q_SR_FF_B, Q_BAR_SR_FF_B; //behavioral modeling
	wire Q_SR_FF_D, Q_BAR_SR_FF_D; //dataflow modeling
	wire Q_SR_FF_G, Q_BAR_SR_FF_G; //gatelevel modeling	

	
	//////////////////////////////////
	//////////////////////////////////
	//////////////////////////////////
	//D flip flop
	//input 
	reg D;
	
	//output
	wire Q_D_FF_B, Q_BAR_D_FF_B; //behavioral modeling
	wire Q_D_FF_S, Q_BAR_D_FF_S; //structural modeling
	
	//////////////////////////////////
	//////////////////////////////////
	//////////////////////////////////
	//JK flip flop
	//input 
	reg J, K;
	
	//output
	wire Q_JK_FF_B, Q_BAR_JK_FF_B; //behavioral modeling
	// wire Q_JK_FF_D, Q_BAR_JK_FF_D; //dataflow modeling
	// wire Q_JK_FF_G, Q_BAR_JK_FF_G; //gatelevel modeling
	wire Q_JK_FF_S, Q_BAR_JK_FF_S; //structural modeling
	
	
	//////////////////////////////////
	//////////////////////////////////
	//////////////////////////////////
	//T flip flop
	//input 
	reg T;
	
	//output
	wire Q_T_FF_B, Q_BAR_T_FF_B; //behavioral modeling
	// wire Q_T_FF_G, Q_BAR_T_FF_G; //gatelevel modeling
	wire Q_T_FF_S, Q_BAR_T_FF_S; //structural modeling

	//Module instantiation
	//SR flip flop
	sr_flip_flop_behavioral_module sr_flip_flop_behavioral(.s(S), .r(R), .clk(CLK), .q(Q_SR_FF_B), .q_bar(Q_BAR_SR_FF_B) );	
	sr_flip_flop_dataflow_module sr_flip_flop_dataflow_(.s(S), .r(R), .clk(CLK), .q(Q_SR_FF_D), .q_bar(Q_BAR_SR_FF_D) );
	sr_flip_flop_gatelevel_module sr_flip_flop_gatelevel(.s(S), .r(R), .clk(CLK), .q(Q_SR_FF_G), .q_bar(Q_BAR_SR_FF_G) );
	
	
	//D flip flop
	d_flip_flop_behavioral_module d_flip_flop_behavioral(.d(D), .clk(CLK), .q(Q_D_FF_B), .q_bar(Q_BAR_D_FF_B));		
	// d_flip_flop_dataflow_module d_flip_flop_dataflow(.d(D), .clk(CLK), .q(Q_D_FF_D), .q_bar(Q_BAR_D_FF_D));
	// d_flip_flop_gatelevel_module d_flip_flop_gatelevel(.d(D), .clk(CLK), .q(Q_D_FF_G), .q_bar(Q_BAR_D_FF_G));
	d_flip_flop_structural_module d_flip_flop_structural(.d(D), .clk(CLK), .q(Q_D_FF_S), .q_bar(Q_BAR_D_FF_S));


	//JK flip flop
	jk_flip_flop_behavioral_module jk_flip_flop_behavioral(.j(J), .k(K), .clk(CLK), .q(Q_JK_FF_B), .q_bar(Q_BAR_JK_FF_B));
	// jk_flip_flop_dataflow_module jk_flip_flop_dataflow(.j(J), .k(K), .clk(CLK), .q(Q_JK_FF_D), .q_bar(Q_BAR_JK_FF_D));
	// jk_flip_flop_gatelevel_module jk_flip_flop_gatelevel(.j(J), .k(K), .clk(CLK), .q(Q_JK_FF_G), .q_bar(Q_BAR_JK_FF_G));
	jk_flip_flop_structural_module jk_flip_flop_structural(.j(J), .k(K), .clk(CLK), .q(Q_JK_FF_S), .q_bar(Q_BAR_JK_FF_S));
	
	//T flip flop
	t_flip_flop_behavioral_module t_flip_flop_behavioral(.t(T), .clk(CLK), .q(Q_T_FF_B), .q_bar(Q_BAR_T_FF_B));	
	t_flip_flop_structural_module t_flip_flop_structural(.t(T), .clk(CLK), .q(Q_T_FF_S), .q_bar(Q_BAR_T_FF_S));	
	
	
	
	//adders
	reg A, B, CARRY_IN;
	wire SUM_1, CARRY_OUT_1;
	wire SUM_2, CARRY_OUT_2;
	adder adder_1(.a(A), .b(B), .carry_in(CARRY_IN), .clk(CLK), .sum(SUM_1), .carry_out(CARRY_OUT_1));
	adder2 adder_2(.a(A), .b(B), .carry_in(CARRY_IN), .clk(CLK), .sum(SUM_2), .carry_out(CARRY_OUT_2));
	
	initial
	begin
		 S = 1'b0; R = 1'b0;
		 D = 1'b0;
		 J = 1'b0; K = 1'b0;
		 T = 1'b0;
		 CLK = 1'b0;
		 A = 1'b0; B = 1'b0; CARRY_IN =1'b0;
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
		//test pattern for adders
		#15 A = 1'b1; B = 1'b1; CARRY_IN =1'b1;
		
		// Test pattern for SR flip flop 
		#20 S = 1'b0; R = 1'b0;
		#20 S = 1'b0; R = 1'b1; 
		#20 S = 1'b1; R = 1'b0; 
		//One more iteration
		#20 S = 1'b0; R = 1'b0; 
		#20 S = 1'b0; R = 1'b1; 
		#20 S = 1'b1; R = 1'b0; 
		//#20 S = 1'b1; R = 1'b1; //Selectively use it (you may face "iteration limit")
		
		#20 // Test pattern for D flip flop 
		#20 D = 1'b0; 
		#20 D = 1'b1; 
		#20 D = 1'b0; 
		#40 D = 1'b1; 
		
		// Test pattern for JK flip flop 
		//Fill this out
		
		#20 // Test pattern for T flip flop 		
		//Fill this out

		
		
	end
	
	
endmodule




