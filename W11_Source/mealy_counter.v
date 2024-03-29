module mealy_counter_module(clk, in, rst, out, state);

  input clk, in, rst;

  output [2:0] out, state;
  reg [2:0] out, state;

  parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101, S6 = 3'b110, S7 = 3'b111;

  //Determine the output depending on the current state as well as the incoming input
  always @ (state or in)
  begin
    case (state)
      S0:
      begin
        if (in == 1'b1)
          out = S1;
        else
          out = S7;
      end
      S1:
      begin
        if (in == 1'b1)
          out = S2;
        else
          out = S0;
      end
      S2:
      begin
        if (in == 1'b1)
          out = S3;
        else
          out = S1;
      end
      S3:
      begin
        if (in == 1'b1)
          out = S4;
        else
          out = S2;
      end
      S4:
      begin
        if (in == 1'b1)
          out = S5;
        else
          out = S3;
      end
      S5:
      begin
        if (in == 1'b1)
          out = S6;
        else
          out = S4;
      end
      S6:
      begin
        if (in == 1'b1)
          out = S7;
        else
          out = S5;
      end
      S7:
      begin
        if (in == 1'b1)
          out = S0;
        else
          out = S6;
      end
    endcase
  end

  //Determine the next state
  always @ (posedge clk) begin
    if (rst == 1'b1)
      state <= S0;
    else
      case (state)
        S0:
        begin
          if (in == 1'b1)
            state <= S1;
          else
            state <= S7;
        end
        S1:
        begin
          if (in == 1'b1)
            state <= S2;
          else
            state <= S0;
        end
        S2:
        begin
          if (in == 1'b1)
            state <= S3;
          else
            state <= S1;
        end
        S3:
        begin
          if (in == 1'b1)
            state <= S4;
          else
            state <= S2;
        end
        S4:
        begin
          if (in == 1'b1)
            state <= S5;
          else
            state <= S3;
        end
        S5:
        begin
          if (in == 1'b1)
            state <= S6;
          else
            state <= S4;
        end
        S6:
        begin
          if (in == 1'b1)
            state <= S7;
          else
            state <= S5;
        end
        S7:
        begin
          if (in == 1'b1)
            state <= S0;
          else
            state <= S6;
        end
      endcase
  end
endmodule