module rs232_transmitter(data, clk, idle, start, stop, op_bit);
 input [7:0] data;
 input clk;
 output reg idle;
 output reg start;
 output reg stop;
 output reg op_bit;

 reg[3:0] counter;
 reg first_bit;
 reg last_bit;
 reg[7:0] data_copy; 

 initial begin
   idle = 1;
   start = 0;
   stop = 0;
   counter = 1;
   first_bit = 1;
   last_bit = 1;
   data_copy = data;
 end

 //always @(posedge clk) begin
   //if (counter < 8) begin
     //idle = 0;
     //if (first_bit == 1) begin
       //start = 1;
       //first_bit = 0;
     //end
     //op_bit = data_copy[0];
     //data_copy = data_copy >> 1;
     //counter += 1;
   //end else begin
    //idle = 1;
    //start = 0;
    //stop = 1;
    //if(counter == 8)begin
      //last_bit = 1;
      //if(last_bit == 1) begin
        //stop = 1;
        //last_bit = 0;
        //counter = 0;
      //end
   // end
 //  end
 //end

 always @(posedge clk) begin
   if (counter < 8) begin
     idle = 0;
     if (first_bit == 1) begin
       start = 1;
       first_bit = 0;
     end else begin
       start = 0;
     end

     op_bit = data_copy[0];
     data_copy = data_copy >> 1;
     counter += 1;
   end else begin 
     idle = 1;
     if (last_bit == 1)begin
      stop = 1;
      op_bit = data_copy[0];
     end
     start = 0;
   end
 end

endmodule
