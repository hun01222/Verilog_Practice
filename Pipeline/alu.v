
module alu(

    input      [31:0] SrcAE,SrcBE,  // ALU 32-bit Inputs
    input      [4:0]  ALUControlE,  // ALU Selection
    input      [2:0]  funct3E,
    
    output reg [31:0] ALUResult,    // ALU 32-bit Output
    output reg        CarryOut,     // Carry Out Flag
    output reg        ZeroE         // Zero Flag

);

    reg  [31:0]  ALU_Result;
    reg  [32:0]  tmp;

    always @ (*) begin
        tmp       = {1'b0, SrcAE} + {1'b0, SrcBE}; // carry 때문에 만들어줌
        CarryOut  = tmp[32];
    end


	always @ (*) //combinational block so blocking (=) assignment should be used
	begin
	   case(funct3E)
	   3'b000:   ZeroE =  SrcAE == SrcBE; //beq
	   3'b001:   ZeroE =  SrcAE != SrcBE; //bne
	   3'b100:   ZeroE =  SrcAE < SrcBE;  //blt
	   3'b101:   ZeroE =  SrcAE > SrcBE;  //bge
	   3'b110:   ZeroE =  SrcAE < SrcBE;  //bltu
	   3'b111:   ZeroE =  SrcAE >= SrcBE; //bgeu
	   default : ZeroE =  0;
	   endcase
	end

    always @ (*)
    begin
        case(ALUControlE)
        5'b00000: ALUResult =   SrcAE + SrcBE ;
        5'b00001: ALUResult =   SrcAE - SrcBE ;
        5'b00010: ALUResult =   SrcAE * SrcBE;
        5'b00011: ALUResult =   SrcAE / SrcBE;
        5'b00100: ALUResult =   SrcAE<< SrcBE;
        5'b00101: ALUResult =   SrcAE>> SrcBE;
        5'b00110: ALUResult =  {SrcAE[30:0],SrcAE[31]};
        5'b00111: ALUResult =  {SrcAE[0],SrcAE[31:1]};
        5'b01000: ALUResult =   SrcAE & SrcBE;
        5'b01001: ALUResult =   SrcAE | SrcBE;
        5'b01010: ALUResult =   SrcAE ^ SrcBE;
        5'b01011: ALUResult = ~(SrcAE | SrcBE);
        5'b01100: ALUResult = ~(SrcAE & SrcBE);
        5'b01101: ALUResult = ~(SrcAE ^ SrcBE);
        5'b01110: ALUResult =  (SrcAE > SrcBE)  ? 32'd1 : 32'd0 ;
        5'b01111: ALUResult =  (SrcAE == SrcBE) ? 32'd1 : 32'd0 ;
        5'b10000: ALUResult =   SrcBE;
        default:  ALUResult =   SrcAE + SrcBE ;
        endcase
    end
    
endmodule
