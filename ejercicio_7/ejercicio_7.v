// Flip-flop JK hecho con flip-flop D y compuertas
module ejercicio_7 (oQ, iJ, iK, iCLK, iRST);
output oQ;
input iJ, iK, iCLK, iRST;
wire JK;

assign JK = (iJ & ~oQ) | (~iK & oQ);
D_FF JK1 (oQ, JK, iCLK, iRST);		// Crea ejemplar del flip-flop D
endmodule

// Flip-flop D con Reset activo en alto (1 = resetea)
module D_FF (Q, D, CLK, RST);
output reg Q;
input D, CLK, RST;

    always @ (posedge CLK or posedge RST)
        if (RST) 
            Q <= 1'b0; // Si RST es 1, la salida se fuerza a 0 inmediatamente
        else 
            Q <= D;    // Operación normal en el flanco de subida del reloj
endmodule