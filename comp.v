module comp(
    input [3:0] duty,
    input [19:0] count,
    output pwm);

    assign pwm = 
        (duty == 4'b0000 && count < 16200) ? 1'b0 :   // 0°  (0.6 ms)
        (duty == 4'b0001 && count < 21600) ? 1'b0 :   // 18° (0.8 ms)
        (duty == 4'b0010 && count < 27000) ? 1'b0 :   // 36° (1.0 ms)
        (duty == 4'b0011 && count < 32400) ? 1'b0 :   // 54° (1.2 ms)
        (duty == 4'b0100 && count < 37800) ? 1'b0 :   // 72° (1.4 ms)
        (duty == 4'b0101 && count < 43200) ? 1'b0 :   // 90° (1.6 ms)
        (duty == 4'b0110 && count < 48600) ? 1'b0 :   // 108°(1.8 ms)
        (duty == 4'b0111 && count < 54000) ? 1'b0 :   // 126°(2.0 ms)
        (duty == 4'b1000 && count < 59400) ? 1'b0 :   // 144°(2.2 ms)
        (duty == 4'b1001 && count < 64800) ? 1'b0 :   // 162°(2.4 ms)
        (duty == 4'b1010 && count < 67500) ? 1'b0 :   // 180°(2.6 ms)
                                             1'b1; // No realiza nada
 
endmodule