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

//Pre-Charge Reading.
initial

	begin 
		$readmemb("testm3",IM);
		//$readmemb("TestF2_MemInst.mem",IM);
		//$readmemb("test21",IM); 
    
	end

//Bloque Always
always @*

	begin //Inicio_A

		ITM = { IM[RAdrs], IM[RAdrs+1], IM[RAdrs+2], IM[RAdrs+3] };

	end

endmodule
