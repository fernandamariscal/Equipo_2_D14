`timescale 1ns/1ns

module EX (
			
			//Inp
			input [4:0] EX,
			input Clk,
			
			//Out
		    output reg [4:0] OutEX
);

/*	
		
		EX ///////////
		RegDs = 1'b1;
		AOp = 3'b010;
		ALUsrc = 1'b0;

*/

always @ (posedge Clk)
begin
		
	OutEX = EX;
		
end

endmodule 