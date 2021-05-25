`timescale 1ns/1ns

//1- Module y Puertos 1/0
module BankR (
		
		//Entradas
		input Rw,
		input [4:0]Rd1,
		input [4:0]Rd2,
		input [4:0]Dir,
		input [31:0]DIn,
		
		//Salidas
		output reg [31:0]L1,
		output reg [31:0]L2
);

//2- Delcaracion de señales --> NA(No aplica)

//Registros
reg [31:0] BReg [0:31];


//3- Cuerpo del modulo (NA)

//Pre-Charge Reading.
initial

	begin
		
		$readmemh("TestF1_BankR.txt",BReg);

	end

//Bloque Always
always @*

begin //Inicio_A

	if (Rw && Dir) //Writting

		BReg[Dir] = DIn;

	//AlwaysReading
	L1 = BReg[Rd1];
	L2 = BReg[Rd2];

end


endmodule