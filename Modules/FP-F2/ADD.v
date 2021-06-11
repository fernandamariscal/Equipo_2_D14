  
`timescale 1ns/1ns

//1- Module y Puertos 1/0
module ADD (
		
		//Entradas
		input [31:0]AIn1,
		input [31:0]AIn2,
		//Salidas
		output [31:0]ARes

);

//2- Delcaracion de señales --> NA(No aplica)

//3- Cuerpo del modulo

//Assign:
assign ARes = AIn1 + AIn2;

endmodule