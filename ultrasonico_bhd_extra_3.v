`timescale 1ns / 1ns

module ultrasonic_bcd (
    input wire clk,             // Reloj de 27 MHz
    input wire echo,            // Entrada Echo
    output reg trigger,         // Salida Trigger al HC-SR04
    output reg [3:0] dist_single // Distancia en cm (0 a 9)
);

    reg [20:0] trig_count = 0;   // Periodo de disparo (60 ms = 1,620,000 ciclos)
    reg [23:0] echo_count = 0;   // Medición del tiempo en ALTO de Echo
    reg [23:0] raw_cm = 0;

    // Generador de Trigger de 10 us (270 ciclos a 27 MHz) cada 60 ms
    always @(posedge clk) begin
        if (trig_count < 20'd1620000) begin
            trig_count <= trig_count + 1'b1;
            if (trig_count < 20'd270)
                trigger <= 1'b1;
            else
                trigger <= 1'b0;
        end else begin
            trig_count <= 0;
        end
    end

    // Procesamiento con redondeo aritmético (+783 ciclos = medio centímetro)
    always @(posedge clk) begin
        if (echo) begin
            echo_count <= echo_count + 1'b1;
        end else if (echo_count > 0) begin
            // Redondeo exacto: (echo_count + 783) / 1566
            raw_cm <= (echo_count + 23'd783) / 1566;
            echo_count <= 0;

            // Mapeo ajustado: 
            // Si detecta pulso pero da 0 por la zona ciega, fuerza a 1 cm
            if (raw_cm == 0)
                dist_single <= 4'd1;
            else if (raw_cm > 9)
                dist_single <= 4'd9;
            else
                dist_single <= raw_cm[3:0];
        end
    end

endmodule