`timescale 1ns / 1ns

module mux_display (
    input wire clk,
    output reg [1:0] sel,
    output wire disp_u,
    output wire disp_d,
    output wire disp_c );

initial sel = 2'b00;

always @(posedge clk) begin
    if(sel == 2'b11)
        sel <= 2'b00;
    else
        sel <= sel + 1'b1;
end

assign disp_u = (sel == 2'b00) ? 1'b0 : 1'b1;
assign disp_d = (sel == 2'b01) ? 1'b0 : 1'b1;
assign disp_c = (sel == 2'b10) ? 1'b0 : 1'b1;

endmodule