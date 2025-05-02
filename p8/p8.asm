%include "../LIB/pc_iox.inc"
extern pBin_n
extern pBin_b
extern pBin_w
extern pBin_dw 

section	.text

	global _start

_start:

    ;nasm -f elf p8.asm && ld -m elf_i386 p8.o ../LIB/libpc_iox.a ../LIB/pbin.o -o p8 && ./p8

    ;---------------------------------------------------------------------------------------------------------------------INCISO A


    mov ecx, 3
    mov ebx,caracteres

    call PEDIR_VECTOR
    
    call IMPRIMIR_VECTOR

    FIN_PROCEDIMIENTO:
        call SALTO_LINEA
        call PRINT_SUCCESS


    ;-------------------------------------------------------------------------------------------

	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel

    SALTO_LINEA:
        push eax
	    mov al,10
	    call putchar
        pop eax
        ret

    PRINT_SUCCESS:
        mov edx, message_success
	    call puts
        ret

    PRINT_ERROR:
        mov edx, message_error
	    call puts
        ret

    PEDIR_VECTOR:

        mov esi, 0

        ;-----------------------Verificar si no es cero
        cmp ecx, 0
            je FIN_PROCEDIMIENTO

        CICLO_PEDIR_DATO:

        ;-----------------------Mostrar mensaje de inicio
        mov edx, message_inicio
	    call puts

        ;-----------------------Pedir dato y restarlo 30h y imprimir en pantalla en hexadecimal
        call getch        
        sub al,30h

        ;-----------------------Validar numero 
        mov bl,0h
        CMP al,bl 
            JAE VERIFICAR_SI_ES_MENOR_IGUAL ;Es mayor o igual X >= 0
        JMP PEDIR_VECTOR ;No es mayor o igual a 0

        VERIFICAR_SI_ES_MENOR_IGUAL:
            mov bl,9h
            CMP al,bl
                JA PEDIR_VECTOR ;Es mayor a 9


        ;-----------------------Guardar dato ingresado
        mov [ebx + esi], al
        inc esi
        
	    call pHex_b
        call SALTO_LINEA
        
        loop CICLO_PEDIR_DATO

        ret

    IMPRIMIR_VECTOR:

        mov esi, 0

        ;-----------------------Mostrar mensaje de inicio
        mov edx, message_print_vector
	    call puts

        ;-----------------------imprimir dato del vector
        mov al,[ebx + esi]
        inc esi
        
	    call pHex_b
        call SALTO_LINEA

        loop IMPRIMIR_VECTOR

        ret

section .data
    message_inicio	db  'INGRESE UN DATO: ',0xa,0 
    message_success	db  'ES CORRECTO',0xa,0 
    message_error	db  'ES INCORRECTO',0xa,0 

    message_print_vector db  'DATOS DEL VECTOR: ',0xa,0 


    msg_captura db 'Caracteres capturados', 0xa, 0
    caracteres db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

