module moore_counter_module(clk, in, rst, out, state, next_state);
  input clk, in, rst;

  output [2:0] out, state, next_state;
  reg [2:0] out, state, next_state;

  parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101, S6 = 3'b110, S7 = 3'b111;

  //Determine the output depending on the current state only
  always @ (state) begin
    case (state)
      S0: out = S1;
      S1: out = S2;
      S2: out = S3;
      S3: out = S4;
      S4: out = S5;
      S5: out = S6;
      S6: out = S7;
      S7: out = S0;
      default: out = S0;
    endcase
  end

  //Update the current state
  always @ (posedge clk)
  begin
    if (rst == 1'b1)
      state = S0;
    else
      state = next_state;
  end

  //Determine the next stage
  always @ (posedge clk)
  begin
    if (rst == 1'b1)
      next_state <= S0;
    else
    begin
      case (state)
        S0:
        begin
          if (in == 1'b1)
            next_state <= S1;
          else
            next_state <= S7;
        end
        S1:
        begin
          if (in == 1'b1)
            next_state <= S2;
          else
            next_state <= S0;
        end
        S2:
        begin
          if (in == 1'b1)
            next_state <= S3;
          else
            next_state <= S1;
        end
        S3:
        begin
          if (in == 1'b1)
            next_state <= S4;
          else
            next_state <= S2;
        end
        S4:
        begin
          if (in == 1'b1)
            next_state <= S5;
          else
            next_state <= S3;
        end
        S5:
        begin
          if (in == 1'b1)
            next_state <= S6;
          else
            next_state <= S4;
        end
        S6:
        begin
          if (in == 1'b1)
            next_state <= S7;
          else
            next_state <= S5;
        end
        S7:
        begin
          if (in == 1'b1)
            next_state <= S0;
          else
            next_state <= S6;
        end
      endcase
    end
  end
endmodule