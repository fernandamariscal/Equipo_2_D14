`timescale 1ns/1ns

//1- Module y Puertos 1/0
module Sl_3 (
		
		//Entradas
		input [25:0]SLInp_3,
		
		//Salidas
		output reg [27:0]SLOut_3

);

//2- Delcaracion de señales --> NA(No aplica)

//3- Cuerpo del modulo


assign SLOut_3 = SLInp_3 << 2;

endmodule
