`timescale 1ps/1ps

module PCPlus4 (
    input      [31:0] PCF,
    output reg [31:0] PCPlus4F
);
    always @ (*) begin
        PCPlus4F = PCF + 4;
    end

    
endmodule