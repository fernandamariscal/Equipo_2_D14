`timescale 1ns/1ns


module EX_MEM (
    input WBrw,
    input WBmtoreg,
	input MBranch,
	input MMemRead,
	input MMemWrite,
    input [31:0] addResult,
    input zero, 
	input [31:0] ALUResult, 
	input [31:0] readData2,
    input [4:0] ExtoMemWB,
	input Clk,
	input OutWBrw,
    input OutWBmtoreg,
	output reg OutBranch,
	output reg OutMemRead,
	output reg OutMemWrite,
    output reg [31:0] outAddResult,
    output reg Outzero,
	output reg [31:0] outALUResult, 
	output reg [31:0] outReadData2,
    output reg [4:0] outExtoMemWB
	
   
   
);
    always @(posedge Clk)
    begin
	OutWB = WB;
	OutBranch = MBranch;
	OutMemRead = MMemRead;
	OutMemWrite = MMemWrite; 
    outAddResult = addResult;
    Outzero = zero;
    outALUResult = ALUResult;
    outReadData2 = readData2;
    outExtoMemWB = ExtoMemWB;
  
   
    

end 
endmodule 