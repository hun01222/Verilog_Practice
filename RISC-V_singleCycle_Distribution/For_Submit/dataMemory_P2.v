module dataMemory_P2
    #(parameter Width = 32)
(
    input clk, memWrite, memRead,
    input [Width-1:0] address, writeData,
    output reg [Width-1:0] readData
);
    reg [Width-1:0] mem[511:0];

    initial begin
        mem[0] = 32'h00000000;
        mem[1] = 32'h00000001;
        mem[2] = 32'h00000002;
        mem[3] = 32'h00000003;
        mem[4] = 32'h00000004;
        mem[5] = 32'h00000005;
        mem[6] = 32'h00000006;
        mem[7] = 32'h00000007;
    end
    
    always @(*) begin
        if(memRead == 1'b1)
            readData = mem[address];
        else if(memWrite == 1'b1)
            mem[address] = writeData;
    end
endmodule