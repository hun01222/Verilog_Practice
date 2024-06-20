`timescale 1ps/1ps

module Register_File (
    input      [4:0]  A1,
    input      [4:0]  A2,
    input      [4:0]  RdW,
    input      [31:0] ResultW,
    input             clk,
    input             RegWriteW,
    input             rst,
    output reg [31:0] RD1,
    output reg [31:0] RD2,
	//it is to see x1 of register file (you can ignore it if your simulator allows you to see full RF)
    output reg [31:0] checkx1,  
    output reg [31:0] checkx2,
    output reg [31:0] checkx3,
    output reg [31:0] checkx4,
    output reg [31:0] checkx5,
    output reg [31:0] checkx6

);
    reg [31:0] Registers[31:0];
    integer i;

    always @(*) begin
        //Registers[28] = 32'd6;
        //Registers[22] = 32'd4;
        //Registers[18] = 32'd6;

        
        RD1 = Registers[A1];
        RD2 = Registers[A2];

        checkx1 = Registers[1];
        checkx2 = Registers[2];
        checkx3 = Registers[3];
        checkx4 = Registers[4];
        checkx5 = Registers[5];
        checkx6 = Registers[6];
        
    end

    always @(negedge clk) begin
        if (rst) 
		begin
			Registers[0] = 64'd0;
			Registers[1] = 64'd101;
			Registers[2] = 64'd102;
			Registers[3] = 64'd103;
			Registers[4] = 64'd104;
			Registers[5] = 64'd105;
			Registers[6] = 64'd106;
			Registers[7] = 64'd107;
			Registers[8] = 64'd108;
			Registers[9] = 64'd109;
			Registers[10] = 64'd110;
			Registers[11] = 64'd111;
			Registers[12] = 64'd112;
			Registers[13] = 64'd113;
			Registers[14] = 64'd114;
			Registers[15] = 64'd115;
			Registers[16] = 64'd116;
			Registers[17] = 64'd117;
			Registers[18] = 64'd118;
			Registers[19] = 64'd119;
			Registers[20] = 64'd120;
			Registers[21] = 64'd121;
			Registers[22] = 64'd122;
			Registers[23] = 64'd123;
			Registers[24] = 64'd124;
			Registers[25] = 64'd125;
			Registers[26] = 64'd126;
			Registers[27] = 64'd127;
			Registers[28] = 64'd128;
			Registers[29] = 64'd129;
			Registers[30] = 64'd130;
			Registers[31] = 64'd131;   
        end 
		else if (RegWriteW && (|RdW)) 
		begin    //|RdW, avoid writing at x0
            Registers[RdW] <= ResultW;
        end
    end
    
endmodule