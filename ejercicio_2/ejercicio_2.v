module ejercicio_2(
    output reg clock
);

    initial begin 
        clock = 1'b0; 
        #300;
    end 

    always 
        #10 clock = ~clock;

endmodule