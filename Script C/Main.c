#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

#define TAM 32

double converBin(int num, int bits);

int main()
{
    system("color f5");
	int  cont=0,i,j, opc, elim, cont1=0;
	int priD[TAM],segD[TAM],terD[TAM];
	char oper[TAM][32];
	char priC[TAM][32], segC[TAM][32], terC[TAM][32];
	char funct[TAM][6];
	char especial[TAM][7];
	char shamt[6];
	char instruccion[TAM][33];
	char concatenar[33];

	int insTipo[TAM];// 1 = R ; 2 = I; 3 = J

	char inmeOoffsetC[2][10]; //1 = unmediate; 2 = offset
	int inmeOoffsetI[TAM];
	strcpy(inmeOoffsetC[0],"inmediate");
	strcpy(inmeOoffsetC[1],"offset");
	FILE *pf;

	strcpy(shamt,"00000");

    do{
        //Imprimir las instrucciones exixtentes
        printf("\n");
                for(i=0;i<cont; i++){
                    printf("%02d.- %s", i+1, instruccion[i]);
                    if(insTipo[i] == 1)
                        printf("   %s $%d, $%d, $%d\n\n", oper[i], priD[i], segD[i], terD[i]);
                    if(insTipo[i] == 2 ){
                        printf("   %s $%d, $%d, #%d\n\n", oper[i], priD[i], segD[i], terD[i]);
                    }
                }
        ///////////////////////////////////////////////////////////////////////////////////////////

        //Imprimir el menu y guardar la opcion elegida
        printf("MENU\n\n1.-Agregar\n2.-Eliminar\n3.-Imprimir y salir\n\nOpcion: ");
        scanf("%d", &opc);
        fflush(stdin);
        ///////////////////////////////////////////////////////////////////////////////////////////
        switch (opc){
            case 1:
                cont1=0;
                system("cls");
                do{
                    fflush(stdin);
                    //if(cont1 >= 0)
                        //printf("Operacion   ");


        //Condicionales para seleccionar la operacion que se realizara con la variable oper
                    if(cont1 == 0){
                        fflush(stdin);
                        //printf("\n");
                        gets(oper[cont]);
                        fflush(stdin);
                        if(strcmp(oper[cont],"add")==0 || strcmp(oper[cont],"Add")==0//add
                           || strcmp(oper[cont],"ADD")==0){
                                strcpy(funct[cont],"100000");
                                strcpy(especial[cont],"000000");
                                insTipo[cont] = 1;
                        }
                        else if(strcmp(oper[cont],"sub")==0 || strcmp(oper[cont],"Sub")==0//sub
                           || strcmp(oper[cont],"SUB")==0){
                                strcpy(funct[cont],"100010");
                                strcpy(especial[cont],"000000");
                                insTipo[cont] = 1;
                           }
                        else if(strcmp(oper[cont],"mul")==0 || strcmp(oper[cont],"Mul")==0//mult
                           || strcmp(oper[cont],"MUL")==0){
                                strcpy(funct[cont],"011000");
                                strcpy(especial[cont],"000000");
                                insTipo[cont] = 1;
                           }
                        else if(strcmp(oper[cont],"div")==0 || strcmp(oper[cont],"Div")==0//div
                           || strcmp(oper[cont],"DIV")==0){
                                strcpy(funct[cont],"011010");
                                strcpy(especial[cont],"000000");
                                insTipo[cont] = 1;
                           }
                        else if(strcmp(oper[cont],"or")==0 || strcmp(oper[cont],"Or")==0//or
                           || strcmp(oper[cont],"OR")==0){
                                strcpy(funct[cont],"100101");
                                strcpy(especial[cont],"000000");
                                insTipo[cont] = 1;
                           }
                        else if(strcmp(oper[cont],"and")==0 || strcmp(oper[cont],"And")==0//and
                           || strcmp(oper[cont],"AND")==0){
                               strcpy(funct[cont],"100100");
                               strcpy(especial[cont],"000000");
                               insTipo[cont] = 1;
                           }
                        else if(strcmp(oper[cont],"slt")==0 || strcmp(oper[cont],"Slt")==0//slt
                           || strcmp(oper[cont],"SLT")==0){
                                strcpy(funct[cont],"101010");
                                strcpy(especial[cont],"000000");
                                insTipo[cont] = 1;
                           }
                        //I
//                        else if(strcmp(oper[cont],"sll")==0 || strcmp(oper[cont],"Sll")==0//sll
//                           || strcmp(oper[cont],"SLL")==0){
//                                strcpy(funct[cont],"000000");
//                                strcpy(especial[cont],"000000");
//                                insTipo[cont] = 1;
//                           }
                        else if(strcmp(oper[cont],"addi")==0 || strcmp(oper[cont],"Addi")==0//addi
                           || strcmp(oper[cont],"ADDI")==0){
                                strcpy(especial[cont],"001000");
                                insTipo[cont] = 2;
                                inmeOoffsetI[cont]=0;
                           }
                        else if(strcmp(oper[cont],"ori")==0 || strcmp(oper[cont],"Ori")==0//ori
                           || strcmp(oper[cont],"ORI")==0){
                                strcpy(especial[cont],"001101");
                                insTipo[cont] = 2;
                                inmeOoffsetI[cont]=0;
                           }
                        else if(strcmp(oper[cont],"andi")==0 || strcmp(oper[cont],"Andi")==0//andi
                           || strcmp(oper[cont],"ANDI")==0){
                                strcpy(especial[cont],"001100");
                                insTipo[cont] = 2;
                                inmeOoffsetI[cont]=0;
                           }
                        else if(strcmp(oper[cont],"lw")==0 || strcmp(oper[cont],"Lw")==0//lw
                           || strcmp(oper[cont],"LW")==0){
                                strcpy(especial[cont],"100011");
                                insTipo[cont] = 2;
                                inmeOoffsetI[cont]=1;
                           }
                        else if(strcmp(oper[cont],"sw")==0 || strcmp(oper[cont],"Sw")==0//sw
                           || strcmp(oper[cont],"SW")==0){
                                strcpy(especial[cont],"101011");
                                insTipo[cont] = 2;
                                inmeOoffsetI[cont]=1;
                           }
                        else if(strcmp(oper[cont],"slti")==0 || strcmp(oper[cont],"Slti")==0//slti
                           || strcmp(oper[cont],"SLTI")==0){
                                strcpy(especial[cont],"001010");
                                insTipo[cont] = 2;
                                inmeOoffsetI[cont]=0;
                           }
                        else if(strcmp(oper[cont],"beq")==0 || strcmp(oper[cont],"Beq")==0//beq
                           || strcmp(oper[cont],"BEQ")==0){
                                strcpy(especial[cont],"000100");
                                insTipo[cont] = 2;
                                inmeOoffsetI[cont]=1;
                           }
                        else if(strcmp(oper[cont],"bne")==0 || strcmp(oper[cont],"Bne")==0//bne
                           || strcmp(oper[cont],"BNE")==0){
                                strcpy(especial[cont],"000101");
                                insTipo[cont] = 2;
                                inmeOoffsetI[cont]=1;
                           }
                        else if(strcmp(oper[cont],"bgtz")==0 || strcmp(oper[cont],"Bgtz")==0//bgtz
                           || strcmp(oper[cont],"BGTZ")==0){
                                strcpy(especial[cont],"000111");
                                insTipo[cont] = 2;
                                inmeOoffsetI[cont]=1;
                                segD[cont]=0;
                           }
                        else{
                            cont1--;
                        }
                    }

            //Se imprime lo que se requiere introducir para la instruccion
//                    if(cont1 >= 1){
//                        if(insTipo[cont] == 2)
//                            printf("rs   ");
//                        else
//                            printf("rd   ");
//                    }
//                    if(cont1 >= 2){
//                        if(insTipo[cont] == 2){
//                            if(strcmp(especial[cont],"000111") != 0)
//                                printf("rt   ");
//                        }
//                        else
//                            printf("rs   ");
//                    }
//                    if(cont1 == 3){
//                        if(insTipo[cont] == 2)
//                            printf("%s", inmeOoffsetC[inmeOoffsetI[cont]]);
//                        else
//                            printf("rt");
//                    }
//                    printf("\n");

            /*Se guardan los valores que introdusca el
            usuario mientrar imprime lo anterior introducido de la misma instruccion*/
                    if(cont1 == 1){
                        printf("%s        $", oper[cont]);
                        scanf("%d", &priD[cont]);
                        if(priD[cont] < 0 || priD[cont] > 31)
                            cont1--;
                    }
                    if(cont1 == 2){
                        printf("%s         $%d ,$", oper[cont], priD[cont]);
                        if(strcmp(especial[cont],"000111") != 0)
                            scanf("%d", &segD[cont]);
                        if(segD[cont] < 0 || segD[cont] > 31)
                            cont1--;
                    }
                    if(cont1 == 3){
                        if(insTipo[cont] == 1 && strcmp(especial[cont],"000111") != 0)
                            printf("%s         $%d  ,$%d  ,$", oper[cont], priD[cont], segD[cont]);
                        else if(insTipo[cont] == 2 && strcmp(especial[cont],"000111") != 0)
                            printf("%s         $%d  ,$%d  ,#", oper[cont], priD[cont], segD[cont]);
                        else
                            printf("%s         $%d    ,#", oper[cont], priD[cont]);

                        scanf("%i", &terD[cont]);
                        if((terD[cont] < 0 || terD[cont] > 31) && insTipo[cont] == 1)
                            cont1--;
                        else if ((terD[cont] < 0 || terD[cont] > 65534) && insTipo[cont] == 2)
                            cont1--;
                    }
                    system("cls");
                    cont1 ++;
                }while(cont1 < 4);

            /*Se llama a una funcion que convierte los numeros introducidos por el usuario de
            decimal a binario, y los datos tipo double que retorna los imprime en una
            variable tipo caracter en forma de cadena, para que al agregarle los "0" a la izquierda
            se mantengan ahi.
            Sin mencionar que a la hora de imprimir los datos se le agregan los "0" a la ves*/
                sprintf(priC[cont], "%05.0lf", converBin(priD[cont], 5));
                sprintf(segC[cont], "%05.0lf", converBin(segD[cont], 5));
                if(insTipo[cont] == 1)
                    sprintf(terC[cont], "%05.0lf", converBin(terD[cont], 5));
                else
                    sprintf(terC[cont], "%016.0lf", converBin(terD[cont], 16));
        /////////////////////////////////////////////////////////////////////////////////////////

            //Concatenacion de los datos en binario segun el orden que requiera la instruccion
                //concatenar instruccion R
                if(insTipo[cont] == 1){
                    strcpy(concatenar, especial[cont]);
                    strcat(concatenar, segC[cont]);
                    strcat(concatenar, terC[cont]);
                    strcat(concatenar, priC[cont]);
                    strcat(concatenar, shamt);
                    strcat(concatenar, funct[cont]);
                }
                //concatenar instruccion I
                else if(strcmp(especial[cont], "001101")==0 || strcmp(especial[cont], "001000")==0
                    || strcmp(especial[cont], "001100")==0 || strcmp(especial[cont], "001010")==0){
                    strcpy(concatenar, especial[cont]);
                    strcat(concatenar, segC[cont]);
                    strcat(concatenar, priC[cont]);
                    strcat(concatenar, terC[cont]);
                }
                else{
                    strcpy(concatenar, especial[cont]);
                    strcat(concatenar, priC[cont]);
                    strcat(concatenar, segC[cont]);
                    strcat(concatenar, terC[cont]);
                }
                strcpy(instruccion[cont], concatenar);
        //////////////////////////////////////////////////////////////////////////////////////

                cont++; //indice de la instruccion en cada arreglo
                break;
            case 2:
            /*eliminacion de instruccion y todos los espacios que corresponden a su indice*/
                printf("\n");
                printf("Que instruccion desea eliminar: ");
                scanf("%d", &elim);
                for(i=elim-1;i<cont;i++){
                    strcpy(priC[i],priC[i+1]);
                    strcpy(segC[i],segC[i+1]);
                    strcpy(terC[i],terC[i+1]);

                    priD[i]=priD[i+1];
                    segD[i]=segD[i+1];
                    terD[i]=terD[i+1];

                    strcpy(oper[i],oper[i+1]);
                    strcpy(oper[i],oper[i+1]);
                    strcpy(oper[i],oper[i+1]);

                    strcpy(especial[i],especial[i+1]);
                    strcpy(instruccion[i],instruccion[i+1]);

                    insTipo[i]=insTipo[i+1];
                    inmeOoffsetI[cont]=inmeOoffsetI[i+1];

                }
                fflush(stdin);
                system("cls");
                cont--;
        ///////////////////////////////////////////////////////////////////////////////////////////
                break;
            case 3:
        //Impresion en un archivo de texto de las instrucciones totales
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
        ///////////////////////////////////////////////////////////////////////////////////////////
                break;
            default:
                fflush(stdin);
                opc = 0;
                system("cls");
                break;
        }
    }while(opc != 3);

	return 0;
}

double converBin(int num, int bits){
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