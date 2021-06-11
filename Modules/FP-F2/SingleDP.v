`timescale 1ns/1ns

//1- Module y Puertos 1/0
module SingleDP (
		
		//Entradas
		input CLK
		
);

//2- Delcaracion de señales.


 /* PC [Inp] */	//PC [Out]:
/* N/A      */	wire [31:0]OutPC;

 /* ADD [Inp]: */ //ADD [Out]:
/* N/A        */  wire [31:0]OutAdd1;

/*Ins Mem [Inp]: */ //Ins Mem [Out]:
/* N/A          */  wire [31:0]OutIns;


//Control Unit [Inp]:
// N/A

//Control Unit [Out]:
wire RegDs;
wire Branch;
wire MRead;
wire MtoR;
wire [2:0]AOp;
wire MWrite;
wire ALUsrc;
wire Rw;

/*MxDP [Inp] | MxSDP [Out] */
/* N/A */      wire [4:0]OutMx1;


/* Reg bank [Inp] | Reg bank [Out] */
/* N/A */           wire [31:0]rd1;
/* N/A */           wire [31:0]rd2;


/* SignEx [Inp] | SignEx [Out] */
/* N/A */         wire [31:0]OutExt;


/* MxDP [Inp] | MxDP [Out] */
/* N/A */       wire [31:0]OutMx2;


/* SL2 [Inp] | SL2 [Out] */
/* N/A */      wire [31:0]OutShift;


/* ALUC [Inp] | ALUC [Out] */
/* N/A */ 		wire [2:0]OutALUC;

/* ALU [Inp] | ALU [Out] */
/* N/A */      wire ZF;
/* N/A */      wire [31:0]OutALU;


/* ADD 2 [Inp] | ADD 2 [Out] */
/* N/A */        wire [31:0]OutAdd2;

/* MxDP [Inp] | MxDP [Out] */
/* N/A */       wire [31:0]OutMx3;

/* Memory [Inp] | Memory [Out] */
/* N/A */         wire [31:0]OutMemD;

/* MxDP [Inp] | MxDP [Out] */
/* N/A */       wire [31:0]OutMx4;


/* WB 1 [Inp] | WB 1 [Out] */
/* N/A */       wire [1:0]OutWB1;

/* M 1 [Inp] | M 1 [Out] */
/* N/A */      wire [2:0]OutM1;

/* EX 1 [Inp] | EX 1 [Out] */
/* N/A */       wire [4:0]OutEX1;


/*--------- SECCIÓN 3 ----- */


/* WB 2 [Inp] | WB 2 [Out] */
/* N/A */       wire [1:0]OutWB2;

/* M 2 [Inp] | M 2 [Out] */
/* N/A */      wire [2:0]OutM2;


//EX_MEM [Inp]:
//N/A

//EX_MEM [Out]:
wire [31:0] InpAdd2;
wire InpZF;
wire [31:0] InpALU;
wire [31:0] Outrd2;
wire [4:0] InpMx1;

/* WB 2 [Inp] | WB 2 [Out] */
/* N/A */       wire [1:0]OutWB3;


//MEM_WB [Inp]:
//N/A

//MEM_WB [Out]:
wire [31:0] InpMemD;
wire [31:0] OALU;
wire [4:0] OMx1;

//IF_ID [Inp]:
/* N/A */

//IF_ID [Out]:
wire [31:0]OutAdd1IF_ID;
wire [31:0]OutInsIF_ID;



//ID_EX [Out]:

wire [31:0]InpAdd1IF_ID;
wire [31:0]Inprd1;
wire [31:0]Inprd2;
wire [31:0]InpExt;
wire [4:0]InpIns1IF_ID;
wire [4:0]InpIns2IF_ID;


//3- Cuerpo del modulo

//Instancias


/*--------- SECCIÓN 1 ------ */

//Instancia MxDP
MxDP prepc (

	(OutM2[2] && InpZF), OutAdd1,
	InpAdd2, OutMx3

);

//Instancia PC
PC pc ( CLK, OutMx3, OutPC ); 

//Instancia ADD 1
ADD add ( OutPC, 32'd4, OutAdd1 );

//Instancia IMem
IMem imem ( OutPC, OutIns);

//instacia IF_ID
IF_ID IF ( 

	//Inp
	OutAdd1,
	OutIns,
	CLK,

	//Out 
	OutAdd1IF_ID, 
	OutInsIF_ID

);

/*--------- SECCIÓN 1 ------ */




/*--------- SECCIÓN 2 ------ */

//Instancia CUnit
CUnit cunit ( 
	
	OutInsIF_ID[31:26],	
	RegDs,
	Branch,
	MRead,
	MtoR,
	AOp,
	MWrite,
	ALUsrc,
	Rw

);


//Instancia Bank
BankR Bank ( 

	OutWB3[1],
	OutInsIF_ID[25:21],
	OutInsIF_ID[20:16],
	OMx1,
	OutMx4,
	rd1,
	rd2

 );

//Instancia SingE
SignE Extensor ( OutIns[15:0], OutExt );

//Instancia WB
WB wb_s2 ( { MtoR, Rw }, CLK, OutWB1 );

//Instancia M
M m_s2 ( { Branch, MRead, MWrite }, CLK, OutM1);

//Instancia EX
EX ex_s2 ( { RegDs, AOp, ALUsrc }, CLK, OutEX1);

//Instancia ID/EX
ID_EX ID ( 

	//Inp
	OutAdd1IF_ID,
	rd1,
	rd2,
	OutExt,
	OutInsIF_ID [20:16],
	OutInsIF_ID [15:11],
	CLK,
	
	//Out
    InpAdd1IF_ID,
    Inprd1,
    Inprd2,
    InpExt,
    InpIns1IF_ID,
    InpIns2IF_ID

);

/*--------- SECCIÓN 2 ------ */




/*-------- SECCIÓN 2.1 ----- */

//Instancia ADD
ADD add_s2_1 ( InpAdd1IF_ID , OutShift, OutAdd2 );

//Instancia SL2
SL2 preadd_s2_1 ( InpExt, OutShift );

//Instancia MxSDP
MxDP PreALU ( OutEX1[0], Inprd2, InpExt, OutMx2 );

//Instancia ALUC
ALUC A_Control ( InpExt[5:0], OutEX1[3:1], OutALUC ); 

//Instancia ALU
ALU alu ( Inprd1, OutMx2, OutALUC, ZF, OutALU );

//Instancia MxSDP
MxSDP Mux_s2_1 ( 

	InpIns1IF_ID,
	InpIns2IF_ID,
	OutEX1[4],
	OutMx1 

);


/*-------- SECCIÓN 2.1 ----- */




/*--------- SECCIÓN 3 ----- */

//Instancia WB
WB wb_s3 ( OutWB1, CLK,  OutWB2 );

//Instancia M
M m_s3 ( OutM1,CLK,  OutM2 );


//Instacia EX/MEM
EX_MEM EX(
	
	//Inp
	OutAdd2,
	ZF,
	OutALU,
	Inprd2,
	OutMx1,
	CLK,

	//Out
	InpAdd2,
	InpZF,
	InpALU,
	Outrd2,
	InpMx1
	
);

//Instancia DMem
DMem rom (

	OutM2[0],
	InpALU,
	Outrd2,
	OutM2[1],
	OutMemD

);


//Instancia WB
WB wb_s3_2 ( OutWB2,CLK,  OutWB3 );


//Instancia MEM/MB
MEM_WB MEM (

	//Inp
	OutMemD,
	InpALU,
	InpMx1,
	CLK,

	//Out
	InpMemD,
	OALU,
	OMx1

);

//Instancia MXDP
MxDP Last_Mx (

	OutWB3[0],
	InpMemD,
	OALU,
	OutMx4
	
);

endmodule 