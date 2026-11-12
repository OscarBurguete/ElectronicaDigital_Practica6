`timescale 1ns / 1ns

module mux_decoder (
    input wire [1:0] sel,
    input wire [3:0] data_u,
    input wire [3:0] data_d,
    input wire [3:0] data_c,
    output reg [3:0] data
);

always @(*) begin
    case (sel)
        2'b00: data = data_u;
        2'b01: data = data_d;
        2'b10: data = data_c;
        default: data = 4'd0;
    endcase
end

endmodule