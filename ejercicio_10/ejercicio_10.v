//Diagrama de estados Mealy (figura 3) 
module ejercicio_10(
	input  ix,
	input  iCLK,
	input  iRST,
	output reg oy
); 
	reg [1:0] Prstate, Nxtstate; 
	parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11; 

	//Restablece el circuito al estado inicial S0=00 (sincrónico con reloj) 
	always @ (posedge iCLK or negedge iRST) begin
		if (~iRST) 
			Prstate <= S0;		//Iniciar en estado S0 (reset) 
		else 
			Prstate <= Nxtstate;		//Actualizar estado 
	end

	//Determinar el siguiente estado 
	always @ (*) begin
		case (Prstate) 
			S0:	if (ix) Nxtstate = S1; else Nxtstate = S0; 
			S1:	if (ix) Nxtstate = S3; else Nxtstate = S0; 
			S2:	if (~ix) Nxtstate = S0; else Nxtstate = S2; 
			S3:	if (ix) Nxtstate = S2; else Nxtstate = S0; 
			default: Nxtstate = S0;
		endcase 
	end

	//Evaluar la salida 
	always @ (*) begin
		case (Prstate) 
			S0: oy = 1'b0; 
			S1:	if (ix) oy = 1'b0; else oy = 1'b1; 
			S2:	if (ix) oy = 1'b0; else oy = 1'b1; 
			S3:	if (ix) oy = 1'b0; else oy = 1'b1; 
			default: oy = 1'b0;
		endcase 
	end
endmodule