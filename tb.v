`timescale 1ns/1ns

module tb;
  wire [7:0] data = 8'b10101010;
  reg clk;
  wire idle;
  wire start;
  wire stop;
  wire op_bit;

  task display_vals;
    begin
      $display("Idle = %b", idle);
      $display("Start = %b", start);
      $display("Stop = %b", stop);
      $display("Output Bit = %b", op_bit);
    end
  endtask

  task display_op_bit;
    begin
      $display("Output Bit = %b", op_bit);
    end
  endtask

  task display_start_bit;
    begin
      $display("Start = %b", start);
    end
  endtask

  task display_stop_bit;
    begin
      $display("Stop = %b", stop);
    end
  endtask

  task display_idle_bit;
    begin
      $display("Idle = %b", idle);
    end
  endtask

  rs232_transmitter rs232_t(
    .data(data),
    .clk(clk),
    .idle(idle),
    .start(start),
    .stop(stop),
    .op_bit(op_bit)
  );

  initial begin
    clk = 0;
    #20;
    clk = 1;
    #20;
    display_vals;
    clk = 0;
    #20;
    clk = 1;
    #20;
    display_vals;
    clk = 0;
    #20;
    clk = 1;
    #20;
    display_vals;
    clk = 0;
    #20;
    clk = 1;
    #20;
    display_vals;
    clk = 0;
    #20;
    clk = 1;
    #20;
    display_vals;
    clk = 0;
    #20;
    clk = 1;
    #20;
    display_vals;
    clk = 0;
    #20;
    clk = 1;
    #20;
    display_vals;
    clk = 0;
    #20;
    clk = 1;
    #20;
    display_vals;
  end
  endmodule
