/* READ ME
The answer about the midterm exam

2.1.
    I zipped the file for executing Problem 2.

2.2.
    mem[ 0] = 32'h52324082; // addi3 x1, 9, 3, 4
    mem[ 4] = 32'h4433C102; // addi3 x2, 2, 3, 7
    mem[ 8] = 32'h4221C182; // addi3 x3, 1, 2, 3

    From the instruction, I can get the result on register[1] = 16, register[2] = 12, register[3] = 6

Thank you.
*/

`timescale 1ns/1ns

module tb_ADDI3();
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
    RISC_V_singleCycle_P2 RISC_V_Core(.clk(CLK), .tbStart(TBSTART), .initInstAddr(INITINSTADDR), .nextInstAddr(NEXTINSTADDR),
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