`timescale 1ns/1ns

module EX(
	input Clk,
	input In_EX,
	output reg Out_RegDst,
	output reg [2:0] Out_Aluop,
	output reg Out_Mux


);

always @(posedge Clk)
    begin
	
	Out_RegDst = In_EX;
	Out_Aluop = In_EX;
	Out_Mux = In_EX;
	
	
	end
endmodule 