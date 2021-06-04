`timescale 1ns/1ns

//1- Module y Puertos 1/0
module PC (
		
		//Entradas
		input PClk,
		input [31:0]NDi,
		//Salidas
		output reg [31:0]PDi

);

//2- Delcaracion de señales --> NA(No aplica)

//3- Cuerpo del modulo

//Señales de estimulo:
initial		/*In 01*/ PDi = 32'b0;

//Bloque Always
always @ (posedge PClk)	

	PDi = NDi;

endmodule
