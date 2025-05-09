#include <stdio.h>

extern int getBit(int value,int num_bit);
extern int suma(int num1,int num2);
extern int strlen(char *palabra);

int dato=4;
int num_bit=0;

int num1=10;
int num2=2;

char palabra[]="a";

int main(){
    // nasm -f elf strlen.asm
    // gcc -m32 p9.c getBit.o suma.o strlen.o -o p9

    printf("\nBit %d del dato: %08x es %d \n",num_bit,dato,getBit(dato,num_bit));

    printf("\nLa suma de los numeros %d y %d es: %d \n",num1,num2,suma(num1,num2));

    printf("\nLa longitud de la palabra: %s es de %d \n",palabra,strlen(palabra));

    return 0;
}