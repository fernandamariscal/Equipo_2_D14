#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

#define TAM 200
#define ENTER 10

double converBin(int num, int bits);
void vaciar(char temp[]);

int main()
{
	int  cont=0,i,j, cont1=0;
	int priD[TAM],segD[TAM],terD[TAM];
	char oper[TAM][32];
	char priC[TAM][32], segC[TAM][32], terC[TAM][32];
	char funct[TAM][6];
	char especial[TAM][7];
	char shamt[6];
	char instruccion[TAM][33];
	char concatenar[33];
	int validacion = 1;
	int lineaError = 0;

	int insTipo[TAM];// 1 = R ; 2 = I; 3 = J

	strcpy(shamt,"00000");


	//vatiables de captura de archivo de texto

	char operacion[10];
    char carac1[10];
    char carac2[10];
    char carac3[10];
    char num1[10];
    char num2[10];
    char num3[10];
    char aux[400];
    char temp;
    int contar=0;


	FILE *f;
	FILE *pf;

	f = fopen("ensamblador.txt", "r");

	if(f == NULL){
        printf("No se a podido abrir el fichero\n");
        exit(1);
    }

    while(!feof(f)){
        fgets(aux,20,f);
        contar++;
    }
    rewind(f);


    do{
        temp='a';

        vaciar(operacion);
        vaciar(carac1);
        vaciar(carac2);
        vaciar(carac3);
        vaciar(num1);
        vaciar(num2);
        vaciar(num3);

        for(i = 0;temp != ' ';i++){
            temp = fgetc(f);
            if(temp != ' '){
                operacion[i]=temp;
            }
        }

        strcpy(oper[cont],operacion);

        //Condicionales para seleccionar la operacion que se realizara con la variable oper
        if(cont1 == 0){
            fflush(stdin);
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
               }
            else if(strcmp(oper[cont],"ori")==0 || strcmp(oper[cont],"Ori")==0//ori
               || strcmp(oper[cont],"ORI")==0){
                    strcpy(especial[cont],"001101");
                    insTipo[cont] = 2;
               }
            else if(strcmp(oper[cont],"andi")==0 || strcmp(oper[cont],"Andi")==0//andi
               || strcmp(oper[cont],"ANDI")==0){
                    strcpy(especial[cont],"001100");
                    insTipo[cont] = 2;
               }
            else if(strcmp(oper[cont],"lw")==0 || strcmp(oper[cont],"Lw")==0//lw
               || strcmp(oper[cont],"LW")==0){
                    strcpy(especial[cont],"100011");
                    insTipo[cont] = 2;
               }
            else if(strcmp(oper[cont],"sw")==0 || strcmp(oper[cont],"Sw")==0//sw
               || strcmp(oper[cont],"SW")==0){
                    strcpy(especial[cont],"101011");
                    insTipo[cont] = 2;
               }
            else if(strcmp(oper[cont],"slti")==0 || strcmp(oper[cont],"Slti")==0//slti
               || strcmp(oper[cont],"SLTI")==0){
                    strcpy(especial[cont],"001010");
                    insTipo[cont] = 2;
               }
            else if(strcmp(oper[cont],"beq")==0 || strcmp(oper[cont],"Beq")==0//beq
               || strcmp(oper[cont],"BEQ")==0){
                    strcpy(especial[cont],"000100");
                    insTipo[cont] = 2;
               }
            else if(strcmp(oper[cont],"bne")==0 || strcmp(oper[cont],"Bne")==0//bne
               || strcmp(oper[cont],"BNE")==0){
                    strcpy(especial[cont],"000101");
                    insTipo[cont] = 2;
               }
            else if(strcmp(oper[cont],"bgtz")==0 || strcmp(oper[cont],"Bgtz")==0//bgtz
               || strcmp(oper[cont],"BGTZ")==0){
                    strcpy(especial[cont],"000111");
                    insTipo[cont] = 2;
                    segD[cont]=0;
               }
            else{
                if(lineaError == 0){
                    validacion=0;
                    cont1--;
                    lineaError=cont;
                }
            }
        }


        for(i = 0;i<2;i++){
            carac1[i]=temp;
            temp = fgetc(f);
        }
        for(i = 0;temp != ',';i++){
            num1[i]=temp;
            temp = fgetc(f);
        }
        if(strcmp(especial[cont],"000111") != 0){
            for(i = 0;i<3;i++){
                carac2[i]=temp;
                temp = fgetc(f);
            }
            for(i = 0;temp != ',';i++){
                num2[i]=temp;
                temp = fgetc(f);
            }
        }
        for(i = 0;i<3;i++){
            carac3[i]=temp;
            temp = fgetc(f);
        }
        for(i = 0;!feof(f) && temp != ENTER;i++){
            num3[i]=temp;
            temp = fgetc(f);
        }

        if(insTipo[cont] == 1){
            if((carac1[0] != ' ' || carac1[1] != '$') && lineaError == 0){
                validacion=0;
                cont1--;
                lineaError=cont;
            }

            if((carac2[0] != ','||carac2[1] != ' ' ||carac2[2] != '$') && lineaError==0){
                validacion=0;
                cont1--;
                lineaError=cont;
            }
            if((carac3[0] != ','||carac3[1] != ' ' ||carac3[2] != '$') && lineaError==0){
                validacion=0;
                cont1--;
                lineaError=cont;
            }
        }
        else if(insTipo[cont] == 2 && strcmp(especial[cont],"000111")!=0){
            if((carac1[0] != ' ' || carac1[1] != '$') && lineaError == 0){
                validacion=0;
                cont1--;
                lineaError=cont;
            }

            if((carac2[0] != ','||carac2[1] !=' '||carac2[2] != '$') && lineaError==0){
                validacion=0;
                cont1--;
                lineaError=cont;
            }
            if((carac3[0] != ','||carac3[1] !=' '||carac3[2] != '#') && lineaError==0){
                validacion=0;
                cont1--;
                lineaError=cont;
            }
        }
        if(strcmp(especial[cont],"000111")==0){
            if((carac1[0] != ' ' || carac1[1] != '$') && lineaError == 0){
                validacion=0;
                cont1--;
                lineaError=cont;
            }
            if((carac3[0] != ','||carac3[1] !=' '||carac3[2] != '#') && lineaError==0){
                validacion=0;
                cont1--;
                lineaError=cont;
            }
        }

        priD[cont] = atoi(num1);
        segD[cont] = atoi(num2);
        terD[cont] = atoi(num3);

        if(insTipo[cont]==1 &&(priD[cont]<0 || priD[cont]>31 || segD[cont]<0 ||
            segD[cont]>31 || terD[cont]<0 || terD[cont]>31)){
            validacion=0;
            cont1--;
            lineaError=cont;
        }
        if(insTipo[cont]==2 &&(priD[cont]<0 || priD[cont]>31 || segD[cont]<0
            || segD[cont]>31 || terD[cont]<0 || terD[cont]>65535)){
            validacion=0;
            cont1--;
            lineaError=cont;
        }



                    //cont1 ++;

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
        //Impresion en un archivo de texto de las instrucciones totales

                if((pf = fopen("instrucciones.txt", "w")) != NULL){
                    if(validacion == 1){
                        for (i=0;i<cont;i++ ){
                            if(i!=0)
                            fprintf(pf, "\n");
                            for(j=0;j<32;j++){
                                if(j == 8 || j == 16 || j == 24)
                                fprintf(pf, "\n");
                                fprintf(pf, "%c", instruccion[i][j]);
                            }
                        }
                    }
                    else
                        fprintf(pf,"Error en tu codigo linea %d", lineaError+1);
                    fclose(pf);
                }
        ///////////////////////////////////////////////////////////////////////////////////////////
    }while(cont < contar);

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

void vaciar(char aux[]){
    int i;
     for(i=0; i<10; i++){
        aux[i] = '\0';
     }
}