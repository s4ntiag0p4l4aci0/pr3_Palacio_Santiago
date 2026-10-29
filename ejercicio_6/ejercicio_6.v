// Flip-flop T hecho con flip-flop D y compuertas
module ejercicio_6 (
    output oQ,
    input iT,
    input iCLK,
    input iRST
);

    wire DT;
    
    // Usamos oQ en lugar de Q
    assign DT = oQ ^ iT; 
    
    D_FF D1 (oQ, DT, iCLK, iRST); // Crea ejemplar del flip-flop D

endmodule // ejercicio_6

// Flip-flop D
module D_FF (
    output reg Q,
    input D,
    input CLK,
    input RST
);

    always @ (posedge CLK or negedge RST)
        if (~RST) 
            Q = 1'b0;
        else 
            Q = D;

endmodule