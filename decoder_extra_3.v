`timescale 1ns / 1ns

module decoder_cm (
    input wire [3:0] data,
    output reg a, b, c, d, e, f, g
);

    always @(*) begin
        case (data)
            // Números del 0 al 9
            4'd0: {a, b, c, d, e, f, g} = 7'b1111110; // 0
            4'd1: {a, b, c, d, e, f, g} = 7'b0110000; // 1
            4'd2: {a, b, c, d, e, f, g} = 7'b1101101; // 2
            4'd3: {a, b, c, d, e, f, g} = 7'b1111001; // 3
            4'd4: {a, b, c, d, e, f, g} = 7'b0110011; // 4
            4'd5: {a, b, c, d, e, f, g} = 7'b1011011; // 5
            4'd6: {a, b, c, d, e, f, g} = 7'b1011111; // 6
            4'd7: {a, b, c, d, e, f, g} = 7'b1110000; // 7
            4'd8: {a, b, c, d, e, f, g} = 7'b1111111; // 8
            4'd9: {a, b, c, d, e, f, g} = 7'b1111011; // 9
            
            // Caracteres especiales para la palabra "cm"
            4'd10: {a, b, c, d, e, f, g} = 7'b0000000; // Espacio en blanco (' ')
            4'd11: {a, b, c, d, e, f, g} = 7'b0001101; // Letra 'c' (d, e, g)
            4'd12: {a, b, c, d, e, f, g} = 7'b0010101; // Letra 'n' / 'm' (c, e, g)
            
            default: {a, b, c, d, e, f, g} = 7'b0000000;
        endcase
    end

endmodule