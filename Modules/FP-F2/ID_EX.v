`timescale 1ns/1ns


module ID_EX(

			
			
			input RegDst_ID,
			input Branch_ID,
			input MemReadID,
			input MemtoReg_ID, 
			input [3:0]Aluop_ID,
			input MemWrite_ID,	
			input AluSrc_ID,
			input RegWrite_ID,
			
			input [31:0] IN_ID,
            input [31:0] RData1_ID,
			input [31:0] RData2_ID,
            input [31:0] SingExtend_ID,
			input [4:0] Ins20_16_ID,
			input [4:0] Ins15_11_ID,
			
			input Clk,
			
			output reg RegDst_Ex,
			output reg Branch_Ex,
            output reg MemRead_Ex,
			output reg MemtoReg_Ex,
			output reg [3:0] Aluop_Ex,
			output reg MemWrite_Ex,
			output reg AluSrcEx,
			output reg RegWrite_Ex,
			
			output reg [31:0] Out_Ex,
			output reg [31:0] RData1_Ex,
			output reg [31:0] RData2_Ex,
			output reg [31:0] SingExtend_Ex,
			output reg [4:0] Ins20_16_Ex,
			output reg [4:0] Ins15_11_Ex
			
            
			
);
always @ (posedge Clk)
begin
		
		RegDst_Ex = RegDst_ID;
		Branch_Ex =  Branch_ID;
		MemRead_Ex =  MemReadID;
		MemtoReg_Ex =  MemtoReg_ID;
	    Aluop_Ex [3:0] = Aluop_ID [3:0];
	    MemWrite_Ex = MemWrite_ID;
		AluSrcEx=  AluSrc_ID;
		RegWrite_Ex =  RegWrite_ID;
		
		Out_Ex = IN_ID;
		RData1_Ex = RData1_ID;
		RData2_Ex = RData2_ID;
		SingExtend_Ex = SingExtend_ID;
		Ins20_16_Ex = Ins20_16_ID;
		Ins15_11_Ex = Ins15_11_ID;
		
		
		
		
		
		
		
		
end

endmodule 