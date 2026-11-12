`timescale 1ns / 1ns

module top_ultrasonic_cm (
    input wire clk,                 // Reloj de 27 MHz (Pin 4)
    input wire echo,                // Entrada Echo del HC-SR04 (vía R de 220 ohm)
    output wire trigger,            // Salida Trigger al HC-SR04
    output wire disp_c,             // Cátodo Display Izquierdo (Distancia)
    output wire disp_d,             // Cátodo Display Central ('c')
    output wire disp_u,             // Cátodo Display Derecho ('m')
    output wire a, b, c, d, e, f, g // Bus de 7 Segmentos
);

    wire [3:0] dist_val;
    wire [3:0] data_to_dec;
    wire div_clk_wire;
    wire [1:0] sel_wire;

    // 1. Instancia del controlador de Ultrasonido (entrega la distancia en dist_val)
    ultrasonic_bcd u_hc04 (
        .clk(clk),
        .echo(echo),
        .trigger(trigger),
        .dist_single(dist_val)
    );

    // 2. Divisor de Frecuencia a ~120 Hz
    div_freq_mux u_div (
        .clk(clk),
        .div_clk(div_clk_wire)
    );

    // 3. Seleccionador de los 3 Dígitos
    mux_display u_mux_disp (
        .clk(div_clk_wire),
        .sel(sel_wire),
        .disp_c(disp_c),
        .disp_d(disp_d),
        .disp_u(disp_u)
    );

    // 4. Multiplexor de Datos para alternar entre [Distancia], ['c'] y ['m']
    mux_decoder u_mux_dec (
        .sel(sel_wire),
        .data_dist(dist_val),
        .data(data_to_dec)
    );

    // 5. Decodificador a 7 Segmentos
    decoder_cm u_dec (
        .data(data_to_dec),
        .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g)
    );

endmodule