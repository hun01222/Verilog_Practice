module Registerfile #(parameter Width = 32)(R1, R2, RD1, RD2, clk);
	
	input [4:0] R1;
	input [4:0] R2;
	input clk;
	output [Width-1:0] RD1;
	output [Width-1:0] RD2;
	reg [Width-1:0] Register [Width-1:0];
	reg [Width-1:0] RD1;
	reg [Width-1:0] RD2;
	
	initial
	begin
		Register[0] = 32'd0;
		Register[1] = 32'd1;
		Register[2] = 32'd2;
		Register[3] = 32'd3;
		Register[4] = 32'd4;
		Register[5] = 32'd5;
		Register[6] = 32'd6;
		Register[7] = 32'd7;
		Register[8] = 32'd8;
		Register[9] = 32'd9;
		Register[10] = 32'd10;
		Register[11] = 32'd11;
		Register[12] = 32'd12;
		Register[13] = 32'd13;
		Register[14] = 32'd14;
		Register[15] = 32'd15;
		Register[16] = 32'd16;
		Register[17] = 32'd17;
		Register[18] = 32'd18;
		Register[19] = 32'd19;
		Register[20] = 32'd20;
		Register[21] = 32'd21;
		Register[22] = 32'd22;
		Register[23] = 32'd23;
		Register[24] = 32'd24;
		Register[25] = 32'd25;
		Register[26] = 32'd26;
		Register[27] = 32'd27;
		Register[28] = 32'd28;
		Register[29] = 32'd29;
		Register[30] = 32'd30;
		Register[31] = 32'd31;
	end
	
	//assign RD1 = (R1 != 0) ? Register[R1] : 32'dx;
	//assign RD2 = (R2 != 0) ? Register[R2] : 32'dx;
	
	always @(posedge clk)
	begin
		if (R1 != 0 && R2 != 0)
		begin
			RD1 <= Register[R1];
			RD2 <= Register[R2];
		end
		else
		begin
			RD1 <= 32'dx;
			RD2 <= 32'dx;
		end
	end
endmodule

