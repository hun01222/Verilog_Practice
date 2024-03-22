module t_flip_flop_behavioral_module (t, clk, q, q_bar);
  input t;
  input clk;

  output q, q_bar;
  reg q, q_bar;

  always @ (posedge clk)
  begin
    case(t)
      1'b0 : q <= q; q_bar <= q_bar;
      1'b1 : q <= q_bar; q_bar <= q;
    endcase
  end

endmodule