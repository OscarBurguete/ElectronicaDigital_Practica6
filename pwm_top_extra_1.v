module pwm_top(clk,duty,pwm);

input clk;
input [4:0]duty;
output pwm;

wire [19:0]data;
wire reset_w;

counter u1(
.clk(clk), // in 
.reset(reset_w), //in
.delay_clk(data) //out
);

reset_module u2(
.counter(data), //in
.reset(reset_w) //out
);

comp u3(
.duty(duty), //in 
.count(data), //in
.pwm(pwm) //out
);

endmodule 

