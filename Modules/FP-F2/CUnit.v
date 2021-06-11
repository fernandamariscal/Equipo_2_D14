`timescale 1ns/1ns

//1- Module y Puertos 1/0
module CUnit (
		
		//Entradas
		input [5:0]UIn,
		//Salidas
		output reg RegDs,
		output reg Branch,
		output reg MRead,
		output reg MtoR,  
		output reg [2:0]AOp,
		output reg MWrite,
		output reg ALUsrc,
		output reg Urw
);

//2- Delcaracion de señales --> NA(No aplica)

//3- Cuerpo del modulo

//Desde el Set [31:27]

//Bloque Always
always @*

	begin //Inicio_A
	
		case (UIn)

			6'b000000: //TYPE-R

				
				begin
				

				RegDs = 1'b1;
				Branch = 1'b0;
				MRead = 1'b0;
				MtoR = 1'b1;
				AOp = 3'b010;
				MWrite = 1'b0;
				ALUsrc = 1'b0;
				Urw = 1'b1;
				
				end  //}
				
			6'b100011: begin//LW
			
				RegDs = 1'b0;
				Branch = 1'b0;
				MRead = 1'b1;
				MtoR = 1'b1;
				AOp = 3'b011;
				MWrite = 1'b0;
				ALUsrc = 1'b1;
				Urw = 1'b1;
				
				end
				
			6'b101011: begin//SW
			
				RegDs = 1'b0;
				Branch = 1'b0;
				MRead = 1'b0;
				MtoR = 1'bx;
				AOp = 3'b011;
				MWrite = 1'b1;
				ALUsrc = 1'b1;
				Urw = 1'b0;
				
				end
						
						
			6'b000100: begin//BEQ
			
				RegDs = 1'b0;
				Branch = 1'b1;
				MRead = 1'b0;
				MtoR = 1'bx;
				AOp = 3'b001;
				MWrite = 1'b0;
				ALUsrc = 1'b0;
				Urw = 1'b0;
				
				end 
				
				
			6'b001000: //ADDI

				
				begin
				

				RegDs = 1'b1;
				Branch = 1'b0;
				MRead = 1'b0;
				MtoR = 1'b1;
				AOp = 3'b011;
				MWrite = 1'b0;
				ALUsrc = 1'b1;
				Urw = 1'b1;
				
				end  //}
				
				
			6'b001100: //ANDI

				
				begin
				

				RegDs = 1'b1;
				Branch = 1'b0;
				MRead = 1'b0;
				MtoR = 1'b1;
				AOp = 3'b101;
				MWrite = 1'b0;
				ALUsrc = 1'b1;
				Urw = 1'b1;
				
				end  //}
				
			6'b001101: //ORI

				
				begin
				

				RegDs = 1'b1;
				Branch = 1'b0;
				MRead = 1'b0;
				MtoR = 1'b1;
				AOp = 3'b110;
				MWrite = 1'b0;
				ALUsrc = 1'b1;
				Urw = 1'b1;
				
				end  //}
				
			6'b001010: //SLTI

				
				begin
				

				RegDs = 1'b1;
				Branch = 1'b0;
				MRead = 1'b0;
				MtoR = 1'b1;
				AOp = 3'b100;
				MWrite = 1'b0;
				ALUsrc = 1'b1;
				Urw = 1'b1;
				
				end  //}
				
			default:

				begin  //{

		    	RegDs = 1'bx;
				Branch = 1'bx;
				MRead = 1'bx;
				MtoR = 1'bx;
				AOp = 3'dx;
				MWrite = 1'bx;
				ALUsrc = 1'bx;
				Urw = 1'bx;
				
				end//}

		endcase

	end //Fin_A

		/*	
		
		WB ///////////////
			MtoR = 1'b1;
			Urw = 1'b1;	
		M  ///////////////
			Branch = 1'b0;
			MRead = 1'b0;
			MWrite = 1'b0;
		EX ///////////////
			RegDs = 1'b1;
			AOp = 3'b010;
			ALUsrc = 1'b0;

		*/


endmodule 

