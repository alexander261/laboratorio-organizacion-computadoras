%include "../LIB/pc_iox.inc"
extern pBin_n
extern pBin_b
extern pBin_w
extern pBin_dw 

section	.text

	global _start

_start:

    ;nasm -f elf p7.asm && ld -m elf_i386 p7.o ../LIB/libpc_iox.a ../LIB/pbin.o -o p7 && ./p7

    ;JMP C_INCISO_C
    ;---------------------------------------------------------------------------------------------------------------------INCISO A

    A_PEDIR_DATO:
        
        mov edx, inicio
	    call puts
        
        call getche
        mov bl,al

        ;-------------------------------------------------------------------------------------------
	    mov al,10
	    call putchar
        ;-------------------------------------------------------------------------------------------
        
        mov al,bl


    A_VERIFICAR_SI_ES_MAYOR_IGUAL:
        mov bl,"0"
        CMP al,bl 
            JAE A_VERIFICAR_SI_ES_MENOR_IGUAL ;Es mayor o igual X >= 0
        JMP A_PEDIR_DATO

    A_VERIFICAR_SI_ES_MENOR_IGUAL:
        mov bl,"9"
        CMP al,bl
            JA A_PEDIR_DATO ;Es mayor
    
    A_ES_MENOR_A_5:
        mov bl,"4"
        CMP al,bl
            JBE A_ES_MENOR ;Es menor o igual

    A_ES_MAYOR:
        mov edx, msg_mayor
	    call puts
        JMP A_FIN

    A_ES_MENOR:
        mov edx, msg_menor
	    call puts
        JMP A_FIN

    
    A_FIN:

    ;-------------------------------------------------------------------------------------------
	mov al,10
	call putchar
    ;-------------------------------------------------------------------------------------------

    ;---------------------------------------------------------------------------------------------------------------------INCISO B


    B_PEDIR_DATO:
        
        mov edx, inicio
	    call puts
        
        call getche
        mov bl,al

        ;-------------------------------------------------------------------------------------------
	    mov al,10
	    call putchar
        ;-------------------------------------------------------------------------------------------
        
        mov al,bl

    B_VERIFICAR_SI_ES_NUMERO:

        B_VERIFICAR_SI_ES_MAYOR_IGUAL:
            mov bl,"0"
            CMP al,bl 
                JAE B_VERIFICAR_SI_ES_MENOR_IGUAL ;Es mayor o igual X >= 0
            JMP B_VERIFICAR_SI_ES_LETRA ;No es mayor o igual a 0

        B_VERIFICAR_SI_ES_MENOR_IGUAL:
            mov bl,"9"
            CMP al,bl
                JA B_VERIFICAR_SI_ES_LETRA ;Es mayor a 9
        JMP B_ES_NUMERO




    B_VERIFICAR_SI_ES_LETRA:


        B_VERIFICAR_SI_ES_MAYOR_IGUAL_LETRA:
            mov bl,"A"
            CMP al,bl 
                JAE B_VERIFICAR_SI_ES_MENOR_IGUAL_LETRA ;Es mayor o igual X >= A
            JMP B_NO_RANGO ;No es mayor o igual a A

        B_VERIFICAR_SI_ES_MENOR_IGUAL_LETRA:
            mov bl,"Z"
            CMP al,bl
                JA B_NO_RANGO ;Es mayor a Z
        JMP B_ES_LETRA
    

    B_ES_NUMERO:
        mov edx, msg_numero
	    call puts
        JMP B_FIN


    B_ES_LETRA:
        mov edx, msg_letra
	    call puts
        JMP B_FIN


    B_NO_RANGO:
        mov edx, msg_no_rango
	    call puts
        JMP B_FIN
    

    B_FIN:

    ;-------------------------------------------------------------------------------------------
	mov al,10
	call putchar
    ;-------------------------------------------------------------------------------------------

    ;---------------------------------------------------------------------------------------------------------------------INCISO C

    C_INCISO_C:

    mov cx,5
    mov bx,5
    C_CICLO:

        mov al,"*"
	    call putchar

        dec cx

        CMP cx,bx
            JAE C_CICLO ;es mayor o igual a cero

    C_FIN:


    ;-------------------------------------------------------------------------------------------
	mov al,10
	call putchar
    ;-------------------------------------------------------------------------------------------

    ;-------------------------------------------------------------------------------------------

	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel


section .data
    inicio	db  'INGRESE UN DATO: ',0xa,0 
    msg_menor	db  'el numero SI es menor A 5',0xa,0 
    msg_mayor	db  'el numero NO es menor A 5',0xa,0 

    msg_letra	db  'el dato es LETRA',0xa,0 
    msg_numero	db  'el dato es NUMERO',0xa,0 
    msg_no_rango	db  'el dato no esta entre 0-9 o A-Z',0xa,0 


