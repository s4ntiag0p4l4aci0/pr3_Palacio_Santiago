// Descripción funcional de flip-flop JK a partir de su tabla característica
module ejercicio_9 (
    output oQ,
    output oQnot,
    input iJ,
    input iK,
    input iCLK
);

    reg rQ;
    
    assign oQnot = ~rQ;
    assign oQ = rQ;
    
    always @ (posedge iCLK) begin
        if ((iJ == 0) && (iK == 0)) begin
            rQ = rQ;
        end
        else if ((iJ == 1) && (iK == 0)) begin
            rQ = 1'b1;
        end
        else if ((iJ == 0) && (iK == 1)) begin
            rQ = 1'b0;
        end
        else if ((iJ == 1) && (iK == 1)) begin
            rQ = ~rQ;
        end
    end

endmodule