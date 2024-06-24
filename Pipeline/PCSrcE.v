`timescale 1ps/1ps

module PCSrcE_M (
    input             JumpE,
    input             BranchE,
    input             ZeroE,
    output reg        PCSrcE
);

    always @ (*) begin
      PCSrcE = (BranchE & ZeroE) | JumpE;     
    end

endmodule