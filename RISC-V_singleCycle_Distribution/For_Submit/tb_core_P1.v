/* READ ME
I assigned the result on datamemory from mem[0] to mem[2], mat on datamemory from mem[3] to mem[11], vec on datamemory from mem[12] to mem[14].
mat[0][0] = 1, mat[0][1] = 2, mat[0][2] = 3, mat[1][0] = 4, mat[1][1] = 5, mat[1][2] = 6, mat[2][0] = 7, mat[2][1] = 8, mat[2][2] = 9,
vec[0] = 1, vec[1] = 2, vec[2] = 3

After simulating tb, I can get the result as below.
result[0] = 14, result[1] = 32 , result[2] = 50

The answer about the midterm exam.

1.1.
    mem[ 0] = 32'h05FB8263; // beq  x31,x23,34

    mem[ 4] = 32'h01DE8D33; // add   x26,x29,x29
    mem[ 8] = 32'h01DD0D33; // add   x26,x26,x29
    mem[12] = 32'h003D0D02; // addi  x26,x26,3
    mem[16] = 32'h000F0D82; // addi  x27,x30,0
    mem[20] = 32'h01BD0D33; // add   x26,x26,x27
    mem[24] = 32'h00CD8D82; // addi  x27,x27,12
    mem[28] = 32'h000D0C03; // lw    x24,0(x26)
    mem[32] = 32'h000D8C83; // lw    x25,0(x27)
    mem[36] = 32'h419C1C33; // mul   x24,x24,x25
    mem[40] = 32'h018F8FB3; // add   x31,x31,x24
    mem[44] = 32'h001F0F02; // addi  x30,x30,1

    mem[48] = 32'h01EB8263; // beq   x30,x23,0
    mem[52] = 32'h01FE8007; // sw    x29,0(x31)
    mem[56] = 32'h00000F82; // addi  x31,x0,0
    mem[60] = 32'h00000F02; // addi  x30,x0,0
    mem[64] = 32'h001E8E82; // addi  x29,x29,1

    mem[68] = 32'h03DB8863; // beq   x29,x23,24


1.2.
    18 instructions

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