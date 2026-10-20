module ejercicio_1(
    input clk_in,       
    output reg led_out     
);

    reg [23:0] c = 0;   // Contador

    always @(posedge clk_in) begin
        if (c == 12499999) begin
            c <= 0;
            led_out <= ~led_out; // Parpadeo a 2 Hz
        end else begin
            c <= c + 1;
        end
    end

endmodule