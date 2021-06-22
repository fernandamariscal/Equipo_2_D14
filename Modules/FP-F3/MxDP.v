`timescale 1ns/1ns

//1- Module y Puertos 1/0
module MxDP (
		
		//Entradas
		input SMx,
		input [31:0]MI1,
		input [31:0]MI2,
		//Salidas
		output reg[31:0]RMx

);

//2- Delcaracion de señales --> NA(No aplica)

//3- Cuerpo del modulo

//Case 0 = MI1
//Case 1 = MI2

//Bloque Always
always @* begin        
	
	case ( SMx )

		0: RMx = MI1;

		1: RMx = MI2;

	//default:

	//	RMx = 5'bx;

	endcase
//$display ( " SMx[%d]; MI1[%d]; MI2[%d]; RMx[%d]; ",SMx,MI1,MI2,RMx); 
end

endmodule 