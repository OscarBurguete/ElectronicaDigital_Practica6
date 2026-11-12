module counter (clk,rst, reset, delay_clk);
 input clk;
 input rst;
 input reset;
 output reg[19:0]delay_clk; //540000d 
 always@(posedge reset,posedge clk)
begin
   if(reset | rst)
        delay_clk <= 0;
    else
        delay_clk<=delay_clk+1;
 end
endmodule
