`timescale 1ns/1ns

module tb;
  wire [7:0] data = 8'b11111101;
  wire [7:0] op_data ;
  reg clk;
  wire idle;
  wire start;
  wire stop;
  wire op_bit;
  wire finish;
  wire [2:0] comm_a;
  wire [2:0] comm_b;

  task display_vals;
    begin
      $display("Idle = %b", idle);
      $display("Start = %b", start);
      $display("Stop = %b", stop);
      $display("Output Bit = %b", op_bit);
      $display("Output Data = %b", op_data);
      $display("Finish = %b", finish);
      $display("Communication Wire A = %b", comm_a);
      $display("Communication Wire B = %b", comm_b);
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
   
  task display_op_data;
    begin
      $display("Output Data = %b", op_data);
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

  rs424_transmitter rs424_t(
    .clk(clk),
    .ip_bit(op_bit),
    .tda(comm_a),
    .tdb(comm_b)
  );

  rs424_receiver rs424_r(
    .clk(clk),
    .rda(comm_a),
    .rdb(comm_b),
    .op_bit(op_bit)
  );

  rs232_receiver rs232_r(
    .clk(clk),
    .ip_bit(op_bit),
    .op_data(op_data),
    .finish(finish)
  );


  initial begin
    clk = 0;
    #20;
    clk = 1;
    #40;
    display_vals;
    clk = 0;
    #20;
    clk = 1;
    #40;
    display_vals;
    clk = 0;
    #20;
    clk = 1;
    #40;
    display_vals;
    clk = 0;
    #20;
    clk = 1;
    #40;
    display_vals;
    clk = 0;
    #20;
    clk = 1;
    #40;
    display_vals;
    clk = 0;
    #20;
    clk = 1;
    #40;
    display_vals;
    clk = 0;
    #20;
    clk = 1;
    #40;
    display_vals;
    clk = 0;
    #20;
    clk = 1;
    #40;
    display_vals;
  end
  endmodule
