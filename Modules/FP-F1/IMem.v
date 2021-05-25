`timescale 1ns/1ns

//1- Module y Puertos 1/0
module IMem (
		
		//Entradas
		input [31:0]RAdrs,

		//Salidas
		output reg [31:0]ITM
);

//2- Delcaracion de señales --> NA(No aplica)

//Registros
reg [7:0] IM [0:399];

//3- Cuerpo del modulo

//Bloque Always
always @*

	begin //Inicio_A

		ITM = { IM[RAdrs], IM[RAdrs+1], IM[RAdrs+2], IM[RAdrs+3] };

	end

//Pre-Charge Reading.
initial

	begin
		
		$readmemb("TestF1_IMem.txt",IM);

	end

endmodule