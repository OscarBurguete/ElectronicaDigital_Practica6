module comp(
    input [3:0] duty,
    input [19:0] count,
    output reg pwm,
    output reg [3:0] units,
    output reg [3:0] tens,
    output reg [3:0] hundreds
);

always @(*) begin
    case(duty)
        4'b0000: begin // 0° (0.6 ms)
            pwm      = (count < 16200) ? 1'b0 : 1'b1;
            hundreds = 4'd0;
            tens     = 4'd0;
            units    = 4'd0;
        end

        4'b0001: begin // 45° (1.1 ms)
            pwm      = (count < 29700) ? 1'b0 : 1'b1;
            hundreds = 4'd0;
            tens     = 4'd4;
            units    = 4'd5;
        end

        4'b0011: begin // 90° (1.6 ms)
            pwm      = (count < 43200) ? 1'b0 : 1'b1;
            hundreds = 4'd0;
            tens     = 4'd9;
            units    = 4'd0;
        end

        4'b0111: begin // 135° (2.1 ms)
            pwm      = (count < 56700) ? 1'b0 : 1'b1;
            hundreds = 4'd1;
            tens     = 4'd3;
            units    = 4'd5;
        end

        4'b1111: begin // 180° (2.5 ms)
            pwm      = (count < 67500) ? 1'b0 : 1'b1;
            hundreds = 4'd1;
            tens     = 4'd8;
            units    = 4'd0;
        end

        default: begin // Apagado / Posición de seguridad
            pwm      = 1'b1;
            hundreds = 4'd0;
            tens     = 4'd0;
            units    = 4'd0;
        end
    endcase
end

endmodule