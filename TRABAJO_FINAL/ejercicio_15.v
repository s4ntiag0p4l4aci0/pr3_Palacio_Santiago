module ejercicio_15( 
    input wire CLK, 
    input wire RST,         // Reset activo en alto (1 = reinicia, 0 = opera)
    output reg E, 
    output reg RS, 
    output wire RW, 
    output reg INIlisto, 
    output reg [7:0] DATOS 
); 
 
    parameter Espera_20ms          = 4'd0; 
    parameter Enviar_SetFunction   = 4'd1; 
    parameter Envia_EntryModeSet   = 4'd2; 
    parameter Enviar_DisplayControl= 4'd3; 
    parameter Envia_DisplayClear   = 4'd4; 
    parameter Envia_Direccion      = 4'd5; 
    parameter Caracter1            = 4'd6;  // 'S'
    parameter Caracter2            = 4'd7;  // 'a'
    parameter Caracter3            = 4'd8;  // 'n'
    parameter Caracter4            = 4'd9;  // 't'
    parameter Caracter5            = 4'd10; // 'i'
    parameter Caracter6            = 4'd11; // 'a'
    parameter Caracter7            = 4'd12; // 'g'
    parameter Caracter8            = 4'd13; // 'o'
    parameter Termina_Aqui         = 4'd14; 
         
    reg [3:0] estado; 
    reg [2:0] cuentas;  

    assign RW = 1'b0;                    

    always @ (posedge CLK or posedge RST) begin 
        if (RST) begin 
            INIlisto <= 1'b0;           
            RS       <= 1'b0;                 
            E        <= 1'b0;           
            DATOS    <= 8'h00;       
            cuentas  <= 3'd0;           
            estado   <= Espera_20ms;         
        end else begin                        
            case (estado) 
                Espera_20ms: begin 
                    INIlisto <= 1'b0;       
                    RS       <= 1'b0;         
                    E        <= ~E;     
                    DATOS    <= 8'h00; 
                    if (cuentas < 3) begin 
                        cuentas <= cuentas + 1; 
                        estado  <= Espera_20ms; 
                    end else begin 
                        cuentas <= 3'd0; 
                        estado  <= Enviar_SetFunction; 
                    end 
                end 

                Enviar_SetFunction: begin         
                    INIlisto <= 1'b0;    
                    RS       <= 1'b0;        
                    E        <= ~E;    
                    DATOS    <= 8'h38; // Function Set
                    estado   <= Envia_EntryModeSet; 
                end 

                Envia_EntryModeSet: begin                
                    INIlisto <= 1'b0;        
                    RS       <= 1'b0;                
                    E        <= ~E;      
                    DATOS    <= 8'h06; // Entry Mode Set
                    estado   <= Enviar_DisplayControl; 
                end 

                Enviar_DisplayControl: begin 
                    INIlisto <= 1'b0;    
                    RS       <= 1'b0;        
                    E        <= ~E;    
                    DATOS    <= 8'h0E; // Display On
                    estado   <= Envia_DisplayClear; 
                end 

                Envia_DisplayClear: begin 
                    INIlisto <= 1'b0;    
                    RS       <= 1'b0;        
                    E        <= ~E;    
                    DATOS    <= 8'h01; // Clear Display
                    estado   <= Envia_Direccion; 
                end 

                Envia_Direccion: begin 
                    INIlisto <= 1'b0;     
                    RS       <= 1'b0;        
                    E        <= ~E;    
                    DATOS    <= 8'h80; // DDRAM Address
                    estado   <= Caracter1; 
                end 

                Caracter1: begin            
                    INIlisto <= 1'b1;     
                    RS       <= 1'b1;        
                    E        <= ~E;    
                    DATOS    <= 8'h53; // 'S'
                    estado   <= Caracter2; 
                end 

                Caracter2: begin            
                    INIlisto <= 1'b1;         
                    RS       <= 1'b1;            
                    E        <= ~E;    
                    DATOS    <= 8'h61; // 'a'
                    estado   <= Caracter3; 
                end 

                Caracter3: begin            
                    INIlisto <= 1'b1;         
                    RS       <= 1'b1;            
                    E        <= ~E;    
                    DATOS    <= 8'h6E; // 'n'
                    estado   <= Caracter4;  
                end 

                Caracter4: begin                 
                    INIlisto <= 1'b1;         
                    RS       <= 1'b1;            
                    E        <= ~E;    
                    DATOS    <= 8'h74; // 't'
                    estado   <= Caracter5; 
                end 

                Caracter5: begin                 
                    INIlisto <= 1'b1;         
                    RS       <= 1'b1;            
                    E        <= ~E;    
                    DATOS    <= 8'h69; // 'i'
                    estado   <= Caracter6; 
                end 

                Caracter6: begin                 
                    INIlisto <= 1'b1;         
                    RS       <= 1'b1;            
                    E        <= ~E;    
                    DATOS    <= 8'h61; // 'a'
                    estado   <= Caracter7; 
                end 

                Caracter7: begin                 
                    INIlisto <= 1'b1;         
                    RS       <= 1'b1;            
                    E        <= ~E;    
                    DATOS    <= 8'h67; // 'g'
                    estado   <= Caracter8; 
                end 

                Caracter8: begin                 
                    INIlisto <= 1'b1;         
                    RS       <= 1'b1;            
                    E        <= ~E;    
                    DATOS    <= 8'h6F; // 'o'
                    estado   <= Termina_Aqui; 
                end 

                Termina_Aqui: begin              
                    INIlisto <= 1'b1;     
                    RS       <= 1'b0;          
                    E        <= 1'b0;    
                    DATOS    <= 8'h00;  
                    estado   <= Termina_Aqui; 
                end 

                default: 
                    estado <= Espera_20ms; 
            endcase 
        end 
    end 
endmodule