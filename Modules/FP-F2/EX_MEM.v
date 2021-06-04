`timescale 1ns/1ns


module EX_MEM (
    input WB,
	input M,
	input zero,
	input Branch,
	input MemWrite,
	input MemRead,
    input [31:0] addResult, 
	input [31:0] ALUResult, 
	input [31:0] readData2,
    input [4:0] Mux,
	input Clk,
	output reg OutWB,
	output reg OutM,
	output reg Outzero,
	output reg OutBranch,
	output reg OutMemWrite,
	output reg OutMemRead,
    output reg [31:0] outAddResult,
	output reg [31:0] outALUResult, 
	output reg [31:0] outReadData2,
    output reg [4:0] outMux
	
   
   
);
    always @(posedge Clk)
    begin
	OutWB = WB;
	OutM = M;
	Outzero = zero;
	OutBranch = Branch;
	OutMemWrite = MemWrite;
	OutMemRead = MemRead; 
    outAddResult = addResult;
    outALUResult = ALUResult;
    outReadData2 = readData2;
    outMux = Mux;
  
   
    

end 
endmodule 