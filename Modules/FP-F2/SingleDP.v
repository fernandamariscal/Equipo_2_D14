`timescale 1ns/1ns

//1- Module y Puertos 1/0
module SingleDP (
		
		//Entradas
		input CLK
		
);

//2- Delcaracion de señales.


//PC [Inp]:
//N/A

//PC [Out]:
wire [31:0]OutPC;


//ADD [Inp]:
//N/A

//ADD [Out]:
wire [31:0]OutAdd1;


//Instruction Mem [Inp]:
// N/A

//Instruction Mem [Out]:
wire [31:0]OutIns;


//Control Unit [Inp]:
// N/A

//Control Unit [Out]:
wire RegDs;
wire Branch;
wire MRead;
wire MtoR;
wire [3:0]AOp;
wire MWrite;
wire ALUsrc;
wire Rw;

//MxDP [Inp]:
// N/A

//MxSDP [Out]:
wire [4:0]OutMx1;


//Reg bank [Inp]:
// N/A

//Reg bank [Out]:
wire [31:0]rd1;
wire [31:0]rd2;


//SignEx [Inp]:
// N/A

//SignEx [Out]:
wire [31:0]OutEx;


//MxDP [Inp]:
// N/A

//MxDP [Out]:
wire [31:0]OutMx2;


//SL2 [Inp]:
// N/A

//SL2 [Out]:
wire [31:0]OutShift;


//ALUC [Out]:
// N/A

//ALUC [Out]:
wire [2:0]OutALUC;


//ALU [Inp]:
// N/A

//ALU [Out]:
wire ZF;
wire [31:0]OutALU;


//ADD 2 [Inp]:
// N/A

//ADD 2 [Out]:
wire [31:0]OutAdd2;


//MxDP [Inp]:
// N/A

//MxDP [Out]:
wire [31:0]OutMx3;


//Memory [Inp]:
// N/A

//Memory [Out]:
wire [31:0]OutMemD;



//MxDP [Inp]:
// N/A

//MxDP [Out]:
wire [31:0]OutMx4;


//3- Cuerpo del modulo

//Instancias


//IF_ID [Inp]:
// N/A

//IF_ID [Out]:
wire [31:0]OutAdd1IF_ID;
wire [31:0]OutInsIF_ID;


//ID_EX [Inp]:
//wire [31:0] OutInsIF_ID;

//ID_EX [Out]:
wire InpRegDs;
wire InpBranch;
wire InpMRead;
wire InpMtoR;
wire [2:0]InpAOp;
wire InpMWrite;
wire InpALUsrc;
wire InpRw;
wire [31:0]InpAdd1IF_ID;
wire [31:0]Inprd1;
wire [31:0]Inprd2;
wire [31:0]InpEx;
wire [4:0]InpIns1IF_ID;
wire [4:0]InpIns2IF_ID;

//instacia IF_ID


IF_ID IF ( 

		OutAdd1,
		OutIns,
		CLK, 
		OutAdd1IF_ID, 
		OutInsIF_ID

);



ID_EX ID ( 

	//Inp
	OutAdd1IF_ID,
	rd1,
	rd2,
	OutEx,
	OutInsIF_ID [20:16],
	OutInsIF_ID [15:11],
	CLK,
	
	//Out
    InpAdd1IF_ID,
    Inprd1,
    Inprd2,
    InpEx,
    InpIns1IF_ID,
    InpIns2IF_ID

);

//EX_MEM [Inp]:
wire WB;
wire M;

//EX_MEM [Inp]:
wire InpWB;
wire InpM;
wire MemWrite;
wire MemRead;
wire [31:0]MemAddress;
wire [31:0]WriteData;
wire [4:0]ExtoMemWB;

EX_MEM EX(
	WB,
	M,
	Out,
	Add,
	WriteData,
	Mux,
	CLK);


MEM_WB MEM( RegWrite, OutMux2, OutMux2, OutMux2, WriteRegister, CLK  );




//Instancia PC
PC pc ( CLK, OutMx3, OutPC ); 

//Instancia ADD 1
ADD add ( OutPC, 32'd4, OutAdd1 );

//Instancia IMem
IMem imem ( OutPC, OutIns);

//Instancia CUnit
CUnit cunit ( 
	
	OutIns[31:26],	
	RegDs,
	Branch,
	MRead,
	MtoR,
	AOp,
	MWrite,
	ALUsrc,
	Rw
);

//Instancia MxSDP
MxSDP prebank ( OutIns[20:16], OutIns[15:11], RegDs, OutMx1 );

//Instancia Bank
BankR Bank ( 

	Rw,
	OutIns[25:21],
	OutIns[20:16],
	OutMx1,
	OutMx4,
	rd1,
	rd2

 );

//Instancia SingE
SignE Extensor ( OutIns[15:0], OutEx );

//Instancia MxSDP
MxDP PreALU ( ALUsrc, rd2, OutEx, OutMx2 );

//Instancia SL2
SL2 Shift ( OutEx, OutShift );

//Instancia ALUC
ALUC A_Control ( OutIns[5:0], AOp, OutALUC ); 

//Instancia ALU
ALU alu ( rd1, OutMx2, OutALUC, ZF, OutALU );

//Instancia ALU
ADD premx ( OutAdd1, OutShift, OutAdd2 );

//Instancia MxDP
MxDP skip ( (Branch && ZF), OutAdd1, OutAdd2, OutMx3 );

//Instancia DMem
DMem rom ( MWrite, OutALU, rd2, MRead, OutMemD );

//Instancia MXDP
MxDP Last_Mx ( MtoR, OutMemD, OutALU, OutMx4);

endmodule
