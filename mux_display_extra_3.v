`timescale 1ns / 1ns

module mux_display (
    input wire clk,
    output reg [1:0] sel,
    output wire disp_c, // Display de la Distancia (Izquierda)
    output wire disp_d, // Display de la Letra 'c' (Centro)
    output wire disp_u  // Display de la Letra 'm' (Derecha)
);

    initial sel = 2'b00;

    always @(posedge clk) begin
        if (sel == 2'b10)
            sel <= 2'b00;
        else
            sel <= sel + 1'b1;
    end

    assign disp_c = (sel == 2'b00) ? 1'b0 : 1'b1;
    assign disp_d = (sel == 2'b01) ? 1'b0 : 1'b1;
    assign disp_u = (sel == 2'b10) ? 1'b0 : 1'b1;

endmodule