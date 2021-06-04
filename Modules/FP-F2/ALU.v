`timescale 1ns/1ns

//1- Module y Puertos 1/0
module ALU (
		
		//Entradas
		input [31:0]Op1,
		input [31:0]Op2,
		input [3:0]S_Op,
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
		
		4'b0000: //1. ADD
			R_Op = Op1 + Op2;
		
		4'b0001: //2. SUB
			R_Op = Op1 - Op2;
		
		4'b0010: //3. MULT
			R_Op = Op1 * Op2;
		
		4'b0011: //4. DIV
			R_Op = Op1 / Op2;

		4'b0100: //5. OR
			R_Op = Op1 | Op2;
		
		4'b0101: //6. AND
			R_Op = Op1 & Op2;
		
		4'b0110: //7. SLT
			R_Op = (Op1<Op2) ? 32'b1:32'b0;

		4'b0111: //8. NOP/SLL
			R_Op = Op1 << 0;
			
		4'b1000: //9.ADDI
		    R_Op = Op1 + 10;
			
		4'b1001: //10. SLTI
			R_Op = (Op1<10) ? 32'b1:32'b0;
			
		4'b1010: //11. ANDI
			R_Op = Op1 & 10;
		
		4'b1011: //12. ORI
			R_Op = Op1 | 10 ;
		
		4'b1100: //13. SW
			R_Op = Op1 ;//+ offset;
			
		4'b1101: //14. LW
			R_Op = Op1; //+ offset;
			
		default:
			R_Op = 32'bx;
	
	endcase

	//Flag
	ZF <= (R_Op) ? 0:1;

end //Fin_A

endmodule
