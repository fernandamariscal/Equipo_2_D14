`timescale 1ns/1ns

//1- Module y Puertos 1/0
module MxSDP (
		
		//Entradas
		input [4:0]MSI1,
		input [4:0]MSI2,
		input SMxS,
		//Salidas
		output reg[4:0]RMxS

);

//2- Delcaracion de señales --> NA(No aplica)

//3- Cuerpo del modulo

//Case 0 = MSI1
//Case 1 = MSI2

//Bloque Always
always @* RMxS = SMxS ? MSI2:MSI1;

endmodule