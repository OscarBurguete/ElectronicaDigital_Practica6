module pwm_top(clk,duty,pwm, disp_u, disp_d, disp_c, a, b, c, d, e, f, g );

input clk;                  // Reloj de 27 MHz (Pin 4)
input [3:0] duty;           // 4 DIP switches únicos (Pin 80, 75, 74, 73)
output pwm;                 // Salida PWM al optoacoplador PC817 (Pin 18)
output disp_u;              // Activación Dígito Unidades
output disp_d;              // Activación Dígito Decenas
output disp_c;              // Activación Dígito Centenas
output a, b, c, d, e, f, g; // Bus de 7 Segmentos

wire [19:0]data;
wire reset_w;

wire div_clk_wire;
wire [1:0] sel_wire;
wire [3:0] data_to_dec;
wire [3:0] wire_u;
wire [3:0] wire_d;
wire [3:0] wire_c;

counter u1(
.clk(clk), // in 
.reset(reset_w), //in
.delay_clk(data) //out
);

reset_module u2(
.counter(data), //in
.reset(reset_w) //out
);

comp u3 (
.duty(duty),
.count(data),
.pwm(pwm),
.units(wire_u),
.tens(wire_d),
.hundreds(wire_c)
);

div_freq_mux display_div (
.clk(clk),
.div_clk(div_clk_wire)
);

mux_display u_mux_disp (
.clk(div_clk_wire),
.sel(sel_wire),
.disp_u(disp_u),
.disp_d(disp_d),
.disp_c(disp_c)
);

mux_decoder u_mux_dec (
.sel(sel_wire),
.data_u(wire_u),      
.data_d(wire_d),   
.data_c(wire_c),   
.data(data_to_dec)
);

decoder u_dec (
.data(data_to_dec),
.a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g)
);

endmodule 

