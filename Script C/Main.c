#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

#define TAM 32

int converBin(int num, int bits);

int main()
{
	int  cont=0,i,j, opc, elim, cont1=0;
	int rs[TAM],rt[TAM],rd[TAM];
	int rsD[TAM],rtD[TAM],rdD[TAM];
	char oper[32][TAM];
	char rsC[32][TAM], rtC[32][TAM], rdC[32][TAM];
	char funct[6][TAM];
	char especial[7];
	char shamt[6];
	char instruccion[32][TAM];
	FILE *pf;

	strcpy(especial,"000000");
	strcpy(shamt,"00000");

    do{
        printf("\n");
                for(i=0;i<cont; i++){
                    printf("%d.- ", i+1);
                    for(j=0;j<32;j++){
                        printf("%c", instruccion[i][j]);
                    }
                    printf("   %s $%d, $%d, $%d\n\n", oper[i], rsD[i], rtD[i], rdD[i]);
                }
        printf("\n");

        printf("MENU\n\n1.-Agregar\n2.-Eliminar\n3.-Imprimir y salir\n\nOpcion: ");
        scanf("%d", &opc);

        switch (opc){
            case 1:
                cont1=0;
                system("cls");
                do{
                    fflush(stdin);
                    if(cont1 >= 0)
                        printf("Operacion   ");
                    if(cont1 >= 1)
                        printf("rs   ");
                    if(cont1 >= 2)
                        printf("rt   ");
                    if(cont1 == 3)
                        printf("rd");
                    printf("\n");
                    if(cont1 == 0){
                        fflush(stdin);
                        gets(oper[cont]);
                        fflush(stdin);
                        if(strcmp(oper[cont],"add")==0 || strcmp(oper[cont],"Add")==0
                           || strcmp(oper[cont],"ADD")==0){
                                strcpy(funct[cont],"100000");
                        }
                        else if(strcmp(oper[cont],"sub")==0 || strcmp(oper[cont],"Sub")==0
                           || strcmp(oper[cont],"SUB")==0){
                                strcpy(funct[cont],"100010");
                           }
                        else if(strcmp(oper[cont],"mult")==0 || strcmp(oper[cont],"Mult")==0
                           || strcmp(oper[cont],"MULT")==0){
                                strcpy(funct[cont],"011000");
                           }
                        else if(strcmp(oper[cont],"div")==0 || strcmp(oper[cont],"Div")==0
                           || strcmp(oper[cont],"DIV")==0){
                                strcpy(funct[cont],"011010");
                           }
                        else if(strcmp(oper[cont],"or")==0 || strcmp(oper[cont],"Or")==0
                           || strcmp(oper[cont],"OR")==0){
                                strcpy(funct[cont],"100101");
                           }
                        else if(strcmp(oper[cont],"and")==0 || strcmp(oper[cont],"And")==0
                           || strcmp(oper[cont],"AND")==0){
                               strcpy(funct[cont],"100100");
                           }
                        else if(strcmp(oper[cont],"slt")==0 || strcmp(oper[cont],"Slt")==0
                           || strcmp(oper[cont],"SLT")==0){
                                strcpy(funct[cont],"101010");
                           }
                        else if(strcmp(oper[cont],"sll")==0 || strcmp(oper[cont],"Sll")==0
                           || strcmp(oper[cont],"SLL")==0){
                                strcpy(funct[cont],"000000");
                           }
                        else{
                            cont1--;
                        }
                    }
                    if(cont1 == 1){
                        printf("%s        $", oper[cont]);
                        scanf("%d", &rsD[cont]);
                        if(rsD[cont] < 0 || rsD[cont] > 31)
                            cont1--;
                    }
                    if(cont1 == 2){
                        printf("%s         $%d ,$", oper[cont], rsD[cont]);
                        scanf("%d", &rtD[cont]);
                        if(rtD[cont] < 0 || rtD[cont] > 31)
                            cont1--;
                    }
                    if(cont1 == 3){
                        printf("%s         $%d  ,$%d  ,$", oper[cont], rsD[cont], rtD[cont]);
                        scanf("%i", &rdD[cont]);
                        if(rdD[cont] < 0 || rdD[cont] > 31)
                            cont1--;
                    }
                    system("cls");
                    cont1 ++;
                }while(cont1 < 4);

                rs[cont] = converBin(rsD[cont], 5);
                rt[cont] = converBin(rtD[cont], 5);
                rd[cont] = converBin(rdD[cont], 5);

                sprintf(rsC[cont], "%05d", rs[cont]);
                sprintf(rtC[cont], "%05d", rt[cont]);
                sprintf(rdC[cont], "%05d", rd[cont]);


                strcpy(instruccion[cont], especial);
                strcat(instruccion[cont], rsC[cont]);
                strcat(instruccion[cont], rtC[cont]);
                strcat(instruccion[cont], rdC[cont]);
                strcat(instruccion[cont], shamt);
                strcat(instruccion[cont], funct[cont]);


                cont++;
                break;
            case 2:
                printf("\n");
                printf("Que instruccion desea eliminar: ");
                scanf("%d", &elim);
                for(i=elim-1;i<cont;i++){
                    strcpy(rsC[i],rsC[i+1]);
                    strcpy(rtC[i],rtC[i+1]);
                    strcpy(rdC[i],rdC[i+1]);

                    rs[i]=rs[i+1];
                    rt[i]=rt[i+1];
                    rd[i]=rd[i+1];

                    rsD[i]=rsD[i+1];
                    rtD[i]=rtD[i+1];
                    rdD[i]=rdD[i+1];

                    strcpy(oper[i],oper[i+1]);
                    strcpy(oper[i],oper[i+1]);
                    strcpy(oper[i],oper[i+1]);

                }
                fflush(stdin);
                system("cls");
                cont--;
                break;
            case 3:

                if((pf = fopen("instrucciones.txt", "w")) != NULL){
                    for (i=0;i<cont;i++ ){
                        if(i!=0)
                        fprintf(pf, "\n");
                        for(j=0;j<32;j++){
                            if(j == 8 || j == 16 || j == 24)
                            fprintf(pf, "\n");
                            fprintf(pf, "%c", instruccion[i][j]);
                        }
                    }
                    fclose(pf);
                }
                break;
            default:
                fflush(stdin);
                system("cls");
                break;
        }
    }while(opc != 3);

	return 0;
}

int converBin(int num, int bits){
    int i=0;
    double bin=0;

    i=0;
    while(i<bits){
        if(num%2 == 1)
            bin += pow(10,i);
        num /= 2;
        i++;
    }
    return bin;
}
