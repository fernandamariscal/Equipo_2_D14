`timescale 1ns/1ns

//1- Module y Puertos 1/0
module SignE (
		
		//Entradas
		input [15:0]SEInp,
		
		//Salidas
		output reg [31:0]SEOut

);

//2- Delcaracion de señales --> NA(No aplica)

//3- Cuerpo del modulo

//Bloque Always
always @*

begin //Inicio_A
	
	SEOut = { {16{SEInp[15]}}, SEInp };

end //Fin_A

endmodule