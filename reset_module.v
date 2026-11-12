module reset_module(counter, reset);

input [19:0]counter;
output reset;

assign reset = (counter >= 20'd540000) ? 1'b1: 1'b0;
endmodule
