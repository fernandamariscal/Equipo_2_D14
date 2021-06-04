`timescale 1ns/1ns


module IF_ID(
	
	input[31:0] IAdd,
	input[31:0] InIns,
	input Clk,
	output reg [31:0] Out,
	output reg [31:0] OIns
	


);


always@(posedge Clk)
begin
	Out = IAdd;
	OIns = InIns;

end


endmodule 