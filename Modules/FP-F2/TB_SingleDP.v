`timescale 1ns/1ns

//1- Module y Puertos 1/0
module TB_SingleDP (
		
);

//2- Delcaracion de señales.

//Registers
reg CLK;

//3- Module Structure

//Instances
SingleDP Finish ( CLK );

always #100 CLK = ~CLK; //Always


initial

	begin

	//Evalue
	$dumpfile("Phase 1");
	$dumpvars(0, TB_SingleDP);

	CLK <= 0; #5000

	$stop;

	end 

endmodule
