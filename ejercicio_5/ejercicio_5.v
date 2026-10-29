module ejercicio_5 (
    output reg oQ,
    input      iD,
    input      iCLK,
    input      iRST
);

    always @(posedge iCLK or posedge iRST) begin
        if (iRST) begin
            oQ <= 1'b0; // Si el reset está en 1, la salida se fuerza a 0 inmediatamente
        end else begin
            oQ <= iD;   // Operación normal del Flip-Flop D
        end
    end

endmodule