`timescale 1ns / 1ns

module mux_decoder (
    input wire [1:0] sel,
    input wire [3:0] data_dist, // Número de la distancia
    output reg [3:0] data
);

    always @(*) begin
        case (sel)
            2'b00: data = data_dist; // En sel=00 muestra la distancia
            2'b01: data = 4'd11;     // En sel=01 muestra la 'c'
            2'b10: data = 4'd12;     // En sel=10 muestra la 'm'
            default: data = 4'd10;
        endcase
    end

endmodule