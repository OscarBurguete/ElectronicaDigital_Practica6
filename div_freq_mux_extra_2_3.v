module div_freq_mux(clk,div_clk);
input clk;
output div_clk;
  
parameter limit = 112500;
reg [16:0]q;
  
always@(posedge clk)begin
	if(q==limit)
		q<=0;
	else
		q <= q + 1;
end //always end

assign div_clk = (q == limit)? 1'b1 : 1'b0;

endmodule