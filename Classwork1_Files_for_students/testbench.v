module cpu_tb #(parameter Width = 32);
	reg CLK;
	reg [15:0] INST;
	wire [Width-1:0] OUT;
	
	cpu CPU(.instruction(INST), .out(OUT), .clk(CLK));

	initial
	begin
		
		forever
		begin
			#5 CLK = ~CLK;
		end
	end
	
	initial 
	begin
         CLK = 1'b1;
		 #10 INST <= 16'b00010_00011_000001; // add $2, $3
		 #10 INST <= 16'b00011_00101_000010; // sub $5, $3	
		 #10 INST <= 16'b00110_00001_000011; // and $1, $6 		 	 
		 #10 INST <= 16'b00001_00010_000100; // sll $2, $1		 
	end
	
	
endmodule
