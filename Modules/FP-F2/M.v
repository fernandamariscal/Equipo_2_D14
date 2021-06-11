`timescale 1ns/1ns

module M (
			
			//Inp
			input [2:0] M,
			input Clk,
			
			//Out
		    output reg [2:0] OutM
);

/*	
		
	M /////////////
	Branch = 1'b0;
	MRead = 1'b0;
	MWrite = 1'b0;

*/

always @ (posedge Clk)
begin
		
	OutM = M;
		
end

endmodule 