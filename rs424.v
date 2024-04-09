module rs424_transmitter(clk, ip_bit, tda, tdb);
  input clk;
  input ip_bit;
  output reg [2:0] tda;
  output reg [2:0] tdb;

  always @(posedge clk) begin
    if (ip_bit == 0) begin
      tda = 6;
      tdb = 1;
    end
    if (ip_bit == 1) begin
      tda = 1;
      tdb = 6;
    end
  end
endmodule

module rs424_receiver(clk, rda, rdb, op_bit);
  input clk;
  input [2:0] rda;
  input [2:0] rdb;
  output reg op_bit;

  always @(posedge clk) begin
    if ((rda - rdb) < 0) begin
      op_bit = 1;
    end
    if ((rda - rdb ) > 0) begin
      op_bit = 0;
    end
    
  end
endmodule
