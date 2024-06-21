`timescale 1ps/1ps

module PCTarget (
    input      [31:0] PCE,
    input      [31:0] ImmExtE,
    output reg [31:0] PCTargetE
);
    always @ (*) begin
        PCTargetE = ImmExtE;        
    end


endmodule