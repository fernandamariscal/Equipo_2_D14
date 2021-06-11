`timescale 1ns/1ns


module EX_MEM (
/*
    input WBrw,
    input WBmtoreg,
	input MBranch,
	input MMemRead,
	input MMemWrite,
	*/
    input [31:0] addResult,
    input zero, 
	input [31:0] ALUResult, 
	input [31:0] readData2,
    input [4:0] Mux_S2_1,
	input Clk,
	/*
	input OutWBrw,
    input OutWBmtoreg,
	output reg OutBranch,
	output reg OutMemRead,
	output reg OutMemWrite,
	*/
    output reg [31:0] OutAddResult,
    output reg Outzero,
	output reg [31:0] OutALUResult, 
	output reg [31:0] OutReadData2,
    output reg [4:0] OutMux_S2_1
	
   
   
);
    always @(posedge Clk)
    begin
	
    OutAddResult = addResult;
    Outzero = zero;
    OutALUResult = ALUResult;
    OutReadData2 = readData2;
    OutMux_S2_1 = Mux_S2_1;
  
   
    

end 
endmodule 