module baud_generator (
  output reg tick,
  input enable
);

  parameter PERIOD = 10'd868; // Delay for 115200 Hz (adjust based on your design)

  reg counter; // Internal counter for keeping track of ticks

  always @(posedge enable) begin
    // Reset counter on enable rising edge
    counter <= 1'b0;

    // Generate tick after delay (non-blocking assignment)
    #PERIOD tick <= 1'b1;
    #PERIOD tick <= 1'b0;
  end
endmodule
