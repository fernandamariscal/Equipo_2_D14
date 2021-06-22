`timescale 1ns/1ns

//1- Module y Puertos 1/0
module SL3 (
		
		//Entradas
		input [25:0]SLin3,
		
		//Salidas
		output reg [27:0]SLout3

);

//2- Delcaracion de señales --> NA(No aplica)

//3- Cuerpo del modulo


assign SLout3 = SLin3 << 2;

endmodule
