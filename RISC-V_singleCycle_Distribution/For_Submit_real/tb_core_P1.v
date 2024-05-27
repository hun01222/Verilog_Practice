/* READ ME
I assigned the result on datamemory from mem[0] to mem[2], mat on datamemory from mem[3] to mem[11], vec on datamemory from mem[12] to mem[14].
mat[0][0] = 1, mat[0][1] = 2, mat[0][2] = 3, mat[1][0] = 4, mat[1][1] = 5, mat[1][2] = 6, mat[2][0] = 7, mat[2][1] = 8, mat[2][2] = 9,
vec[0] = 1, vec[1] = 2, vec[2] = 3

After simulating tb, I can get the result as below.
result[0] = 14, result[1] = 32 , result[2] = 50

The answer about the midterm exam.

1.1.
    //lw
    mem[ 0] = 32'h0078783;
    mem[ 4] = 32'h0080803;
    mem[ 8] = 32'h0088883;
    mem[12] = 32'h0090903;
    mem[16] = 32'h0098983;
    mem[20] = 32'h00A0A03;
    mem[24] = 32'h00A8A83;
    mem[28] = 32'h00B0B03;
    mem[32] = 32'h00B8B83;
    mem[36] = 32'h00C0C03;
    mem[40] = 32'h00C8C83;
    mem[44] = 32'h00D0D03;
    
    //R-type
    mem[48] = 32'h40FC1DB3;
    mem[52] = 32'h410C95B3;
    mem[56] = 32'h00BD8DB3;
    mem[60] = 32'h411D15B3;
    mem[64] = 32'h00BD8DB3;

    mem[68] = 32'h412C1E33;
    mem[72] = 32'h413C95B3;
    mem[76] = 32'h00BE0E33;
    mem[80] = 32'h414D15B3;
    mem[84] = 32'h00BE0E33;

    mem[88] = 32'h415C1EB3;
    mem[92] = 32'h416C95B3;
    mem[96] = 32'h00BE8EB3;
    mem[100] = 32'h417D15B3;
    mem[104] = 32'h00BE8EB3;
    
    //store
    mem[108] = 32'h01B60007;
    mem[112] = 32'h01C68007;
    mem[116] = 32'h01D70007;

1.2.
    30 instructions

1.3.
    I zipped the file for executing Problem 1.


Thank you.
*/

`timescale 1ns/1ns

module tb_core_P1();
    // input
    reg CLK, TBSTART;
    reg [31:0] INITINSTADDR;

    // output
    wire [31:0] CURRINSTADDR, CONSECINSTADDR, PCPLUSIMM, NEXTINSTADDR, IMMEDIATE_OFFSET, OFFSET, INSTRUCTION,
                READDATA1_REG, READDATA2_REG, ALUOPERAND2, ALUOUT, READDATA_MEM, WRITEDATA;
    wire [ 3:0] ALUCTRLSIG;
    wire [ 1:0] ALUOP;
    wire REGWRITE, ALUSRC, MEMREAD, MEMWRITE, MEMTOREG, BRANCH, JAL, JALR, ZERO;

    // instantiation
    RISC_V_singleCycle_P1 RISC_V_Core(.clk(CLK), .tbStart(TBSTART), .initInstAddr(INITINSTADDR), .nextInstAddr(NEXTINSTADDR),
                                   .currInstAddr(CURRINSTADDR), .instruction(INSTRUCTION), 
                                   .regWrite(REGWRITE), .readData1_reg(READDATA1_REG), .readData2_reg(READDATA2_REG),
                                   .immediate_offset(IMMEDIATE_OFFSET), 
                                   .ALUOp(ALUOP), .ALUCtrlSig(ALUCTRLSIG),
                                   .ALUSrc(ALUSRC), .ALUOperand2(ALUOPERAND2), .ALUOut(ALUOUT),
                                   .memRead(MEMREAD), .memWrite(MEMWRITE), .readData_mem(READDATA_MEM), .memToReg(MEMTOREG), .writeData(WRITEDATA),
                                   .consecInstAddr(CONSECINSTADDR),
                                   .branch(BRANCH), .zero(ZERO), .jal(JAL), .jalr(JALR), .offset(OFFSET), .PCPlusImm(PCPLUSIMM));
    
    // initialization
    initial begin
        CLK=1'b0; TBSTART=1'b0;
        INITINSTADDR=32'h0000_0000;
    end

    // CLK
    initial begin
        forever begin
            #5 CLK = !CLK;
        end
    end

    // test pattern
    initial begin
        #10 TBSTART = 1'b1;
    end
endmodule