module dataMemory
    #(parameter Width = 32)
(
    input clk, memWrite, memRead,
    input [Width-1:0] address, writeData,
    output reg [Width-1:0] readData
);
    reg [Width-1:0] mem[511:0];

    initial begin
        mem[0] = 32'h00000000;
        mem[1] = 32'h00000000;
        mem[2] = 32'h00000000;
        mem[3] = 32'h00000001;
        mem[4] = 32'h00000002;
        mem[5] = 32'h00000003;
        mem[6] = 32'h00000004;
        mem[7] = 32'h00000005;
        mem[8] = 32'h00000006;
        mem[9] = 32'h00000007;
        mem[10] = 32'h00000008;
        mem[11] = 32'h00000009;
        mem[12] = 32'h00000001;
        mem[13] = 32'h00000002;
        mem[14] = 32'h00000003;
    end
    
    always @(*) begin
        if(memRead == 1'b1)
            readData = mem[address];
        else if(memWrite == 1'b1)
            mem[address] = writeData;
    end
endmodule