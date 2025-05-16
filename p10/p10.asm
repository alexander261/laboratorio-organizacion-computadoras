%include "../LIB/pc_iox.inc"

section .text
global pBin8b

pBin8b:
    push ebp
    mov ebp,esp

    ;------------------------------
    

    mov edx,[ebp + 8] ;Parametro
    SHL edx,24

    mov ecx,8

    printBit:

        SHL edx,1
        JB PRINT_UNO

        PRINT_CERO:
            mov eax,"0"
            call putchar
        
        JMP CONTINUAR

        PRINT_UNO:
            mov eax,"1"
            call putchar

        CONTINUAR:


    LOOP printBit

    ;------------------------------
    
    pop ebp
    ret