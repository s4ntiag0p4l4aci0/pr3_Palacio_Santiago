// Flip-flop T (sin cambios estructurales, la lógica XOR está bien)
module ejercicio_6 (
    output oQ,
    input iT,
    input iCLK,
    input iRST
);

    wire DT;
    
    assign DT = oQ ^ iT; 
    
    D_FF D1 (
        .Q(oQ), 
        .D(DT), 
        .CLK(iCLK), 
        .RST(iRST)
    );

endmodule

// Flip-flop D con Reset Activo en Alto (1 = Resetea a 0)
module D_FF (
    output reg Q,
    input D,
    input CLK,
    input RST
);

    // Cambiamos a posedge RST y evaluamos 'if (RST)' directamente
    always @(posedge CLK or posedge RST) begin
        if (RST) 
            Q <= 1'b0; // Si RST es 1 (activado), la salida se fuerza a 0
        else 
            Q <= D;    // Operación normal
    end

endmodule