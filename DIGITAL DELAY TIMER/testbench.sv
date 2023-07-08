module delay_timer_tb;

  reg clk;
  reg start;
  wire done;

  // Instantiate the delay_timer module
  delay_timer dut (
    .clk(clk),
    .start(start),
    .done(done)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Stimulus generation
  initial begin
    clk = 0;
    start = 0;

    // Dump VCD file and variables
    $dumpfile("delay_timer_tb.vcd");
    $dumpvars(0, delay_timer_tb);

    #10 start = 1;  // Start the delay timer
    #100 start = 0; // Stop the delay timer

    #100 $finish; // End the simulation
  end

  // Monitor
  always @(posedge clk) begin
    if (done)
      $display("Delay timer done at time %0t", $time);
  end

endmodule
