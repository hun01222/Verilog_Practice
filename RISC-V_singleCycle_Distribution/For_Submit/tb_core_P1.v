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