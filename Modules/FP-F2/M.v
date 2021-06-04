`timescale 1ns/1ns

module M(
	input Clk,
	input In_M,
	output reg Out_M


);

always @(posedge Clk)
    begin
	
	Out_M = In_M;
	
	
	end
endmodule 