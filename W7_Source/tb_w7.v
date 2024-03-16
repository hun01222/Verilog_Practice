`timescale 1ns/1ns

module tb_w7;
	
	//////////////////////////////////
	//////////////////////////////////
	//////////////////////////////////
	//SR latch
	//input 
	reg S, R;
	
	//output
	wire Q_SR_LATCH_B, Q_BAR_SR_LATCH_B; //behavioral modeling
	wire Q_SR_LATCH_D, Q_BAR_SR_LATCH_D; //dataflow modeling
	wire Q_SR_LATCH_G, Q_BAR_SR_LATCH_G; //gatelevel modeling	
	
	//////////////////////////////////
	//////////////////////////////////
	//////////////////////////////////
	//Gated SR latch
	//input 	
	reg EN_GATED_SR_LATCH;
	
	//output
	wire Q_GATED_SR_LATCH_B, Q_BAR_GATED_SR_LATCH_B; //behavioral modeling
	wire Q_GATED_SR_LATCH_D, Q_BAR_GATED_SR_LATCH_D; //dataflow modeling
	wire Q_GATED_SR_LATCH_G, Q_BAR_GATED_SR_LATCH_G; //gatelevel modeling	
	
	//////////////////////////////////
	//////////////////////////////////
	//////////////////////////////////
	//D latch
	//input 
	reg D;
	reg EN_D_LATCH;
	
	//output
	wire Q_D_LATCH_B, Q_BAR_D_LATCH_B; //behavioral modeling
	wire Q_D_LATCH_D, Q_BAR_D_LATCH_D; //dataflow modeling
	wire Q_D_LATCH_G, Q_BAR_D_LATCH_G; //gatelevel modeling		
	wire Q_D_LATCH_S, Q_BAR_D_LATCH_S; //structural modeling	

	//Module instantiation
	//SR latch
	sr_latch_behavioral_module sr_latch_behavioral(.s(S), .r(R), .q(Q_SR_LATCH_B), .q_bar(Q_BAR_SR_LATCH_B) );
	sr_latch_dataflow_module sr_latch_dataflow(.s(S), .r(R), .q(Q_SR_LATCH_D), .q_bar(Q_BAR_SR_LATCH_D) );
	sr_latch_gatelevel_module sr_latch_gatelevel(.s(S), .r(R), .q(Q_SR_LATCH_G), .q_bar(Q_BAR_SR_LATCH_G) );
	
	//Gated SR latch
	gated_sr_latch_behavioral_module gated_sr_latch_behavioral(.s(S), .r(R), .en(EN_GATED_SR_LATCH), .q(Q_GATED_SR_LATCH_B), .q_bar(Q_BAR_GATED_SR_LATCH_B) );
	gated_sr_latch_dataflow_module gated_sr_latch_dataflow(.s(S), .r(R), .en(EN_GATED_SR_LATCH), .q(Q_GATED_SR_LATCH_D), .q_bar(Q_BAR_GATED_SR_LATCH_D) );
	gated_sr_latch_gatelevel_module gated_sr_latch_gatelevel(.s(S), .r(R), .en(EN_GATED_SR_LATCH), .q(Q_GATED_SR_LATCH_G), .q_bar(Q_BAR_GATED_SR_LATCH_G) );
	
	//D latch
	d_latch_behavioral_module d_latch_behavioral(.d(D), .en(EN_D_LATCH), .q(Q_D_LATCH_B), .q_bar(Q_BAR_D_LATCH_B));	
	d_latch_dataflow_module d_latch_dataflow(.d(D), .en(EN_D_LATCH), .q(Q_D_LATCH_D), .q_bar(Q_BAR_D_LATCH_D));
	d_latch_gatelevel_module d_latch_gatelevel(.d(D), .en(EN_D_LATCH), .q(Q_D_LATCH_G), .q_bar(Q_BAR_D_LATCH_G));	
	d_latch_sturctural_module d_latch_sturctural(.d(D), .en(EN_D_LATCH), .q(Q_D_LATCH_S), .q_bar(Q_BAR_D_LATCH_S));	
	
	initial
	begin
		 S = 1'b0; R = 1'b0; 
		 D = 1'b0; EN_D_LATCH = 1'b0;
		 EN_GATED_SR_LATCH = 1'b0;
	end
	
	initial 
	begin	
		
		// Test pattern for SR latch and gated SR latch
		#10 S = 1'b0; R = 1'b0; 
		#10 S = 1'b0; R = 1'b1; 
		#10 S = 1'b1; R = 1'b0; 
		//One more iteration
		#10 EN_GATED_SR_LATCH = 1'b1;
		#10 S = 1'b0; R = 1'b0; 
		#10 S = 1'b0; R = 1'b1; 
		#10 S = 1'b1; R = 1'b0; 
		//#10 S = 1'b1; R = 1'b1; //This is for the undefined operation. Just try it and do not take care of it.
		
		#10
		// Test pattern for D latch	
		//Fill this out.
		
	end
	
	
endmodule



