`timescale 1ns/1ns

module WB (
			
			//Inp
			input [1:0] WB,
			input Clk,
			
			//Out
		    output reg [1:0] OutWB     
);

/*	
		
	WB ///////////////
		MtoR = 1'b1;
		Urw = 1'b1;	

*/

always @ (posedge Clk)
begin
		
	OutWB = WB;
		
end

endmodule 