`timescale 1ps/1ps

module pipeline_tb ();
    reg clk;
    reg rst;

    main i_riscv (
        .clk(clk),
        .rst(rst)
    );
    
    initial clk=1;
    always #5 clk=~clk;

    initial begin
        rst = 1;
        #20
        rst = 0;
    end
 
endmodule