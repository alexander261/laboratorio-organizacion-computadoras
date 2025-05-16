#include <stdio.h>

extern void pBin8b(int dato);

int main(){
    // nasm -f elf p10.asm
    // gcc -m32 p10.c  p10.o -o p10
    // gcc -m32 p10.c  p10.o ../LIB/libpc_iox.a -o p10

    printf("\nLa start pBin8b \n");

    pBin8b(10);

    return 0;
}