`timescale 1ns/1ns

//1- Module y Puertos 1/0
module ALU (
		
		//Entradas
		input [31:0]Op1,
		input [31:0]Op2,
		input [2:0]S_Op,
		//Salidas
		output reg ZF,
		output reg[31:0]R_Op
);

//2- Delcaracion de señales --> NA(No aplica)

//3- Cuerpo del modulo

//Bloque Always
always @*

begin //Inicio_A
	
	case (S_Op)
		
		3'b000: //1. ADD
			R_Op = Op1 + Op2;
		
		3'b001: //2. SUB
			R_Op = Op1 - Op2;
		
		3'b010: //3. MULT
			R_Op = Op1 * Op2;
		
		3'b011: //4. DIV
			R_Op = Op1 / Op2;

		3'b100: //5. OR
			R_Op = Op1 | Op2;
		
		3'b101: //6. AND
			R_Op = Op1 & Op2;
		
		3'b110: //7. SLT
			R_Op = (Op1<Op2) ? 32'b1:32'b0;

		3'b111: //8. NOP/SLL
			R_Op = Op1 << 0;
		
		default:
			R_Op = 32'bx;
	
	endcase

	//Flag
	ZF <= (R_Op) ? 0:1;
//$display ( " Op1[%d]; Op2[%d]; S_Op[%d]; ZF[%d]; R_Op[%d];  ",Op1,Op2,S_Op,ZF,R_Op); 
end //Fin_A

endmodule
