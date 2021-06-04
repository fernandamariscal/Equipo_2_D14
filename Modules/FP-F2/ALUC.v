`timescale 1ns/1ns

//1- Module y Puertos 1/0
module ALUC (
		
		//Entradas
		input [5:0]Itr,
		input [2:0]OpA,
		
		//Salidas
		output reg [3:0]IA
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

						IA = 4'b0000;

					6'b100010: /*  SUB  */
											
						IA = 4'b0001;

					6'b011000: /*  MULT */

						IA = 4'b0010;

					6'b011010: /*  DIV  */

						IA = 4'b0011;

					6'b100101: /*  OR   */
											
						IA = 4'b0100;

					6'b100100: /*  AND  */
											
						IA = 4'b0101;

					6'b101010: /*  STL  */

						IA = 4'b0110;

					6'b000000: /* NOP/SLL */
											
						IA = 4'b0111;
					
					6'b001000: //ADDI
					
						IA = 4'b1000;
						
					6'b001010: // SLTI
					
						IA = 4'b1001;
						
					6'b001100: // ANDI
					
						IA = 4'b1010;
						
					6'b001101: // ORI
					
						IA = 4'b1011;
						
					6'b101011: // SW
					
						IA = 4'b1100;
						
					6'b100011: // LW
					
						IA = 4'b1101;
					
					default:

						IA = 3'dx;

				endcase	
			end

			default:
		
				IA = 3'dx;

		endcase

	end

endmodule
