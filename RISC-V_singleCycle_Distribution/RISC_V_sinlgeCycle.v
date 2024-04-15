module RISC_V_singleCycle
(
    input clk, tbStart, [31:0] initInstAddr,
    output [31:0] currInstAddr, consecInstAddr, PCPlusImm, nextInstAddr, immediate_offset, offset, instruction,
                  readData1_reg, readData2_reg, ALUOperand2, ALUOut, readData_mem, writeData,
    output [ 3:0] ALUCtrlSig,
    output [ 1:0] ALUOp,
    output regWrite, ALUSrc, memRead, memWrite, memToReg, branch, jal, jalr, zero
);
    wire [31:0] onGoingInstAddr, dataToReg;
    wire beq, jump, PCPlusImmSel;

    // initialization
    MUX2to1 initInstSel(.in0(initInstAddr), .in1(onGoingInstAddr), .sel(tbStart), .out(nextInstAddr));

    // next instruction fetch // PC
    InstMem INSTMEM(.clk(clk), .PCIn(nextInstAddr), .PCOut(currInstAddr));
    instructionMemory instMem(.address(currInstAddr), .instruction(instruction));
    
    // instruction decode // Register // 여기선 32bit 컴퓨터임
    mainController mainCtrl(.opCode(instruction[6:0]), .ALUSrc(ALUSrc), .memToReg(memToReg), .regWrite(regWrite), .memRead(memRead), .memWrite(memWrite), .branch(branch), .jal(jal), .jalr(jalr), .ALUOp(ALUOp));
    registerFile regFile(.clk(clk), .regWrite(regWrite), .rs1(instruction[19:15]), .rs2(instruction[24:20]), .rd(instruction[11:7]), .writeData(writeData), .readData1(readData1_reg), .readData2(readData2_reg));
    assign jump = jal || jalr;
    MUX2to1 writeDataSel(.in0(dataToReg), .in1(consecInstAddr), .sel(jump), .out(writeData)); // beforeJump(=curr)InstAddr + 4 = consecInstAddr 
    immediateGeneration immGen(.in(instruction[31:0]), .out(immediate_offset));
    ALUControl ALUCtrl(.ALUOp(ALUOp), .funct7_30(instruction[30]), .funct3(instruction[14:12]), .control(ALUCtrlSig)); // ALU controller

    // execute
    MUX2to1 ALUOp2Sel(.in0(readData2_reg), .in1(immediate_offset), .sel(ALUSrc), .out(ALUOperand2));
    ALU fixedPoint_ALU(.control(ALUCtrlSig), .operand1(readData1_reg), .operand2(ALUOperand2), .result(ALUOut), .zero(zero));
    
    // memory
    dataMemory dataMem(.clk(clk), .memWrite(memWrite), .memRead(memRead), .address(ALUOut), .writeData(readData2_reg), .readData(readData_mem));
    MUX2to1 dataToRegSel(.in0(ALUOut), .in1(readData_mem), .sel(memToReg), .out(dataToReg));
    
    // Determining next instruction address
    // consecutive address
    consecutiveInstAddr consecutiveInstAddr(.PC(currInstAddr), .PCPlus4(consecInstAddr));
    // determine what the next instruction is
    assign beq = branch && zero;
    assign PCPlusImmSel = beq || jal;
    mult2 shifter(.in(immediate_offset), .out(offset));
    adder adder_baseOffset(.addend(currInstAddr), .adder(offset), .result(PCPlusImm)); // PC relative
    MUX4to1 onGoingAddrSel(.in0(consecInstAddr), .in1(ALUOut), .in2(PCPlusImm), .sel({PCPlusImmSel, jalr}), .out(onGoingInstAddr));
endmodule