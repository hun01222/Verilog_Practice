module jk_flip_flop_behavioral_module (j, k, clk, q, q_bar);
  input j, k;
  input clk;

  output q, q_bar;
  reg q, q_bar;

  always @ (posedge clk)
  begin
    case({k, j})
      2'b00 : q <= q; q_bar <= q_bar;
      2'b01 : q <= 0; q_bar <= 1;
      2'b10 : q <= 1; q_bar <= 0;
      2'b11 : q <= q_bar; q_bar <= q;
    endcase
  end

endmodule