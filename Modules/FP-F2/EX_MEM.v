`timescale 1ns/1ns


module EX_MEM (
<<<<<<< HEAD
/*
=======
>>>>>>> dec31d34a9e3336c035505f1578e9283b1a1cd50
    input WBrw,
    input WBmtoreg,
	input MBranch,
	input MMemRead,
	input MMemWrite,
<<<<<<< HEAD
	*/
    input [31:0] addResult,
    //input zero, 
=======
    input [31:0] addResult,
    input zero, 
>>>>>>> dec31d34a9e3336c035505f1578e9283b1a1cd50
	input [31:0] ALUResult, 
	input [31:0] readData2,
    input [4:0] ExtoMemWB,
	input Clk,
<<<<<<< HEAD
	/*
=======
>>>>>>> dec31d34a9e3336c035505f1578e9283b1a1cd50
	input OutWBrw,
    input OutWBmtoreg,
	output reg OutBranch,
	output reg OutMemRead,
	output reg OutMemWrite,
<<<<<<< HEAD
	*/
    output reg [31:0] OutAddResult,
    //output reg Outzero,
	output reg [31:0] OutALUResult, 
	output reg [31:0] OutReadData2,
    output reg [4:0] OutExtoMemWB
=======
    output reg [31:0] outAddResult,
    output reg Outzero,
	output reg [31:0] outALUResult, 
	output reg [31:0] outReadData2,
    output reg [4:0] outExtoMemWB
>>>>>>> dec31d34a9e3336c035505f1578e9283b1a1cd50
	
   
   
);
    always @(posedge Clk)
    begin
<<<<<<< HEAD
	/*
	OutWBrw = WBrw;
	OutBranch = MBranch;
	OutMemRead = MMemRead;
	OutMemWrite = MMemWrite; 
	*/
    OutAddResult = addResult;
   // Outzero = zero;
    OutALUResult = ALUResult;
    OutReadData2 = readData2;
    OutExtoMemWB = ExtoMemWB;
=======
	OutWB = WB;
	OutBranch = MBranch;
	OutMemRead = MMemRead;
	OutMemWrite = MMemWrite; 
    outAddResult = addResult;
    Outzero = zero;
    outALUResult = ALUResult;
    outReadData2 = readData2;
    outExtoMemWB = ExtoMemWB;
>>>>>>> dec31d34a9e3336c035505f1578e9283b1a1cd50
  
   
    

end 
endmodule 