`timescale 1ps/1ps

module Branch_Predictor (
    input             ZeroE,
    input             PCSrcE,
    input      [31:0] PCD,
    input      [31:0] PCE,
    input      [31:0] PCTargetE,
    input      [6:0]  OP,
    output reg        FlushD,
    output reg        FlushE,
    output reg [31:0] P_PC
);

  reg [1:0] branch_predictor_state [255:0];
  reg [31:0] branch_predictor_PC [255:0];

  always @ (*) begin // initialization
    if(branch_predictor_PC[PCE]==32'h00000000) begin
      branch_predictor_PC[PCE] = PCTargetE;
    end
  end

  always @ (*) begin // taken on D
    if((OP==2'b1100011)&((branch_predictor_state==2'b10)|(branch_predictor_state==2'b11))) begin
      P_PC = branch_predictor_PC[PCF];
    end
  end

  always @(*) begin
    if((branch_predictor_state[PCE]==2'b00)|(branch_predictor_state[PCE]==2'b01)) begin // not taken on E
      if(zeroE & PCSrcE) begin // true
        // 구현되어 있음

        if(branch_predictor_state[PCE]==2'b00) begin
          branch_predictor_state[PCE]==2'b01;
        end
        else begin
          branch_predictor_state[PCE]==2'b11;
        end
      end
      else begin // false
        // PC = PC + 4

        branch_predictor_state[PCE]==2'b00;
      end


    end

    else begin // taken on E
      if(zeroE & PCSrcE) begin // true
        // 그냥 넘어가면 됨

        branch_predictor_state[PCE]==2'b11;
      end
      else begin  // false
        FlushD = 1;
        FlushE = 1;
        P_PC = PCE + 4;

        if(branch_predictor_state[PCE]==2'b11) begin
          branch_predictor_state[PCE]==2'b10;
        end
        else begin
          branch_predictor_state[PCE]==2'b00;
        end
      end
    end

  end
