`timescale 1ns/1ns


module ID_EX (

			//Inp
			input [31:0] ADD1_ID,
            input [31:0] RData1_ID,
			input [31:0] RData2_ID,
            input [31:0] SingExtend_ID,
			input [4:0] Ins20_16_ID,
			input [4:0] Ins15_11_ID,
			input Clk,
			
			//Out
			output reg [31:0] ADD1_EX,
			output reg [31:0] RData1_Ex,
			output reg [31:0] RData2_Ex,
			output reg [31:0] SingExtend_Ex,
			output reg [4:0] Ins20_16_Ex,
			output reg [4:0] Ins15_11_Ex
			            
);

always @ (posedge Clk)
begin
		
	ADD1_EX = ADD1_EX;
	RData1_Ex = RData1_EX;
	RData2_Ex = RData2_EX;
	SingExtend_Ex = SingExtend_EX;
	Ins20_16_Ex = Ins20_16_EX;
	Ins15_11_Ex = Ins15_11_EX;
		
end

endmodule 