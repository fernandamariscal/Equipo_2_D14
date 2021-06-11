`timescale 1ns/1ns

module MEM_WB(
    /*
	input WB,
	input MemtoReg,
	*/
    input [31:0] ReadData,
    input [31:0] AluResult,
	input [4:0] Mux,
	input Clk,
	/*
	output reg OutWB,
	output reg OutMemtoReg,
	*/
    output reg [31:0] OutReadData,
    output reg [31:0] OutAluResult,
    output reg [4:0]OutMux
);
    always @(posedge Clk)
    begin
	//OutWB = WB;
	//OutMemtoReg = MemtoReg;
    OutReadData = ReadData;
    OutAluResult = AluResult;
    OutMux =Mux;
   
    end 
endmodule 