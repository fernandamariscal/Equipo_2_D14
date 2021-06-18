`timescale 1ns/1ns

//1- Module y Puertos 1/0
module DMem (
		
		//Entradas
		input Ewr,
		input [31:0]Addr,
		input [31:0]RDir,
		input Erd,

		//Salidas
		output reg [31:0]MOut
);

//2- Delcaracion de señales --> NA(No aplica)

//Registros
reg [31:0] Mem [0:31];

//3- Cuerpo del modulo

//Bloque Always
always @*

	begin //Inicio_A

		if (Ewr == 1) //Writting

			begin
			
			Mem[Addr] = RDir;
			MOut = 32'bx;
			
			end
		
		else //Reading

			MOut = Mem[Addr];
			
$display ( " Ewr[%d]; Addr[%d] ; RDir[%d]; Erd[%d]; MOut[%d];",Ewr,Addr,RDir,Erd,MOut, Mem[RDir]);
	end

endmodule
