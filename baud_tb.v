`timescale 1ns/1ns

module baud_generator_tb;

  // Parameters
  parameter PERIOD = 868; // Period for 115200 Hz

  // Inputs
  reg enable;

  // Outputs
  wire tick;

  // Instantiate the baud_generator module
  baud_generator dut(
    .tick(tick),
    .enable(enable)
  );

  // Clock generation
  reg clk;
  always #5 clk = ~clk;

  // Testbench stimulus
  initial begin
    // Initialize inputs
    enable = 0;

    // Open dumpfile
    $dumpfile("baud_generator_tb.vcd");
    $dumpvars(0, baud_generator_tb);

    // Apply stimulus
    #10 enable = 1; // Enable the baud generator

    // Monitor the tick signal
    $monitor("Time: %t, Tick: %b", $time, tick);

    // Run simulation for multiple periods
    repeat(10) begin
      #PERIOD; // Wait for almost one period
      #1; // Wait one more time unit to ensure all edges are captured
    end

    // End simulation
    $finish;
  end

endmodule
