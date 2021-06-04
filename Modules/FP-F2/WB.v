`timescale 1ns/1ns

module WB (
	input Clk,
	input In_WB,
	output reg Out_WB


);

always @(posedge Clk)
    begin
	
	Out_WB = In_WB;
	
	
	
	end
endmodule 