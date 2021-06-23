`timescale 1ns/1ns

module M (
			
			//Inp
			input [3:0] M,
			input Clk,
			
			//Out
		    output reg [3:0] OutM
);

/*	
		
	M /////////////
	Jump = 1'b0;
	Branch = 1'b0;
	MRead = 1'b0;
	MWrite = 1'b0;

*/

always @ (posedge Clk)
begin
		
	OutM = M;
		
end

endmodule 