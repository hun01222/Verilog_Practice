module registerFile
    #(parameter Width = 32)
(
    input  clk, regWrite,
           [4:0] rs1, [4:0] rs2, [4:0] rd,
           [Width-1:0] writeData,
    output [Width-1:0] readData1, readData2
);

    reg [Width-1:0] register [31:0];
    
    initial begin
		register[ 0] = 32'h00000000;
        register[ 1] = 32'h00000002;
        register[ 2] = 32'h00000003;
        register[ 3] = 32'h00000004;
        register[ 4] = 32'h00000005;
        register[ 5] = 32'h00000006;
        register[ 6] = 32'h00000007;
        register[ 7] = 32'h00000008;
        register[ 8] = 32'h00000009;
        register[ 9] = 32'h0000000A;
        register[10] = 32'h0000001A;
        register[11] = 32'h00000012;
        register[12] = 32'h00000013;
        register[13] = 32'h00000014;
        register[14] = 32'h00000015;
        register[15] = 32'h00000016;
        register[16] = 32'h00000017;
        register[17] = 32'h00000018;
        register[18] = 32'h00000019;
        register[19] = 32'h0000001A;
		register[20] = 32'h0000001A;
        register[21] = 32'h00000012;
        register[22] = 32'h00000013;
        register[23] = 32'h00000003;
        register[24] = 32'h00000000;
        register[25] = 32'h00000000;
        register[26] = 32'h00000000;
        register[27] = 32'h00000000;
        register[28] = 32'h00000000;
        register[29] = 32'h00000000;
        register[30] = 32'h00000000;
		register[31] = 32'h00000000;
    end
    
	always @(posedge clk)
	begin
		if(regWrite)
			register[rd] <= writeData;
	end

    assign readData1 = (rs1 != 0) ? register[rs1] : 0;
    assign readData2 = (rs2 != 0) ? register[rs2] : 0;
endmodule