module delay_timer (
  input wire clk,
  input wire start,
  output wire done
);

  reg [31:0] count;
  reg done_reg;

  always @(posedge clk) begin
    if (start) begin
      count <= 32'hFFFFFFFF;  // Set delay time to 2^32 - 1 clock cycles
      done_reg <= 0;
    end
    else if (count > 0) begin
      count <= count - 1;
      done_reg <= 0;
    end
    else if (count == 0) begin
      done_reg <= 1;
    end
  end

  assign done = done_reg;

endmodule
