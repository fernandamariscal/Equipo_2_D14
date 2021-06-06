`timescale 1ns/1ns

module IF_ID(
	
	input[31:0] ADD1IF,
	input[31:0] InsIF,
	input Clk,
	
	output reg [31:0] OutADD1,
	output reg [31:0] OutInsIF

);


always@(posedge Clk)
begin

	OutADD1 = ADD1IF;
	OutInsIF = OutInsIF;

end

endmodule 