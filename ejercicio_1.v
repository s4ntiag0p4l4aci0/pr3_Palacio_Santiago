module ejercicio_1 (
    input clk_in,
    output reg led_out
);

    always @(posedge clk_in) begin
        led_out <= ~led_out;
    end

endmodule