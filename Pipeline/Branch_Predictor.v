`timescale 1ps/1ps

module Branch_Predictor (
    input             BranchE,
    input             ZeroE,
    input             PCSrcE,
    input      [31:0] PCD,
    input      [31:0] PCE,
    input      [31:0] PCTargetE,
    input      [6:0]  OP,
    input             clk,
    output reg        FlushD_BP,
    output reg        FlushE_BP,
    output reg        Taken,
    output reg [31:0] P_PC
);

  reg [1:0] branch_predictor_state [255:0];
  reg [31:0] branch_predictor_PC [255:0];
  
  integer i;

  initial begin
    for(i = 0; i < 255; i = i + 1) begin
      branch_predictor_state[i] = 2'b00;
      branch_predictor_PC[i] = 32'h00000000;
    end
  end

  always @ (posedge clk) begin
    branch_predictor_state[0] = 2'b00;
    if((branch_predictor_PC[PCE]==32'h00000000) && (BranchE)) begin
      branch_predictor_PC[PCE] <= PCTargetE;
    end
  end

  always @ (*) begin // taken on D // 잘 안됨
    if((OP==7'b1100011)&((branch_predictor_state[PCD]==2'b10)|(branch_predictor_state[PCD]==2'b11))) begin
      P_PC = branch_predictor_PC[PCD];
    end
  end

  always @ (*) begin // 잘 됨
    if((branch_predictor_state[PCE]==2'b00)|(branch_predictor_state[PCE]==2'b01)) begin // not taken on E
      if(ZeroE & BranchE) begin // true
        // 구현되어 있음

        if(branch_predictor_state[PCE]==2'b00) begin
          branch_predictor_state[PCE] = 2'b01;
        end
        else begin
          branch_predictor_state[PCE] = 2'b11;
        end
      end
      if(!(ZeroE) & BranchE) begin // false
        // PC = PC + 4

        branch_predictor_state[PCE] = 2'b00;
      end


    end

    else begin // taken on E // 잘 안됨
      if(ZeroE & BranchE) begin // true
        // 그냥 넘어가면 됨 -> 앞서 구현함

        branch_predictor_state[PCE] = 2'b11;
      end
      if(!(ZeroE) & BranchE) begin  // false
        P_PC = PCE + 4;

        if(branch_predictor_state[PCE]==2'b11) begin
          branch_predictor_state[PCE] = 2'b10;
        end
        else begin
          branch_predictor_state[PCE] = 2'b00;
        end
      end
    end
  end

  always @ (*) begin // 잘 안됨
    Taken = ((OP==7'b1100011) & ((branch_predictor_state[PCD]==2'b10) | (branch_predictor_state[PCD]==2'b11)));
    FlushD_BP = (((branch_predictor_state[PCE]==2'b10) | (branch_predictor_state[PCE]==2'b11)) & !(ZeroE & BranchE));
    FlushE_BP = (((branch_predictor_state[PCE]==2'b10) | (branch_predictor_state[PCE]==2'b11)) & !(ZeroE & BranchE));
  end
endmodule