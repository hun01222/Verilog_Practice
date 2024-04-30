module immediateGeneration_P2
    #(parameter Width = 32)
(
    input      [Width-1:0] in,
    output reg [Width-1:0] out
);
    always @(*) begin
        case(in[6:0])
            7'b0000011 : out = {{{Width-12}{in[31]}}, in[31:20]};
            7'b0100011 : out = {{{Width-12}{in[31]}}, in[31:25], in[11:7]};
            7'b1100011 : out = {{{Width-12}{in[31]}}, in[31], in[7], in[30:25], in[11:8]};
            7'b0010011 : out = {{{Width-12}{in[31]}}, in[31:20]};
            7'b1100111 : out = {{{Width-12}{in[31]}}, in[31:20]};
            7'b1101111 : out = {{{Width-20}{in[31]}}, in[31], in[19:12], in[20], in[30:21]};
            7'b0000010 : out = {{{Width-15}{1'b0}}, in[31:17]};
            default    : out = {Width{1'h0}};
        endcase
    end
endmodule