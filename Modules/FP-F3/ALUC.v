`timescale 1ns/1ns

//1- Module y Puertos 1/0
module ALUC (
		
		//Entradas
		input [5:0]Itr,
		input [2:0]OpA,
		
		//Salidas
		output reg [2:0]IA
);

//2- Delcaracion de señales --> NA(No aplica)

//3- Cuerpo del modulo

//Bloque Always
always @*

	begin //Inicio_A	

		case (OpA)
			
			3'b010:

			begin

				case (Itr)
								
								
					6'b100000: /*  ADD  */

						IA = 3'b000;

					6'b100010: /*  SUB  */
											
						IA = 3'b001;

					6'b011000: /*  MULT */

						IA = 3'b010;

					6'b011010: /*  DIV  */

						IA = 3'b011;

					6'b100101: /*  OR   */
											
						IA = 3'b100;

					6'b100100: /*  AND  */
											
						IA = 3'b101;

					6'b101010: /*  STL  */

						IA = 3'b110;

					6'b000000: /* NOP/SLL */
											
						IA = 3'b111;
						
						default:

						IA = 3'dx;
						
						endcase	
			end 


			3'b011: //ADDI Funciona    SW | LW 
				IA = 3'b000;
				
			3'b100: // SLTI Funciona
				IA = 3'b110;
				
			3'b101: // ANDI	Funciona
				IA = 3'b101;
				
			3'b110: // ORI
				IA = 3'b100;
				/*
			3'b111: // SW
				IA = 3'b000;
			
			3'b: // LW 
			
				IA = 3'b000;
						*/
			3'b001: // BEQ	
				IA = 3'b001;
					
			default:
		
				IA = 3'dx;

		endcase

	end

endmodule 