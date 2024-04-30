module InstMem_P2
    #(parameter Width = 32) 
(
    input clk, [Width-1:0] PCIn,
    output reg [Width-1:0] PCOut
);
    always @(posedge clk) begin
        PCOut = PCIn;
    end
endmodule