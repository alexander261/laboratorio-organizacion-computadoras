%include "../LIB/pc_iox.inc"

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point

    ;--------------------------------------INCISO A

    mov ebx,0xA
    mov eax,0x1
    
    add ebx,eax

    mov eax,ebx 


    call pHex_dw

    mov ebx,eax 

	mov al,10 
	call putchar

    ;-------------------------------------- INCISO B 

    push bx

    call pHex_dw


	mov al,10 
	call putchar
    ;-------------------------------------- INCISO C

    mov al, 8
    mul bl

    call pHex_dw

    mov [N],bl

	mov al,10 
	call putchar

    ;-------------------------------------- INCISO D

    inc byte [N]
    call pHex_dw

	mov al,10 
	call putchar

    ;-------------------------------------- INCISO E


	mov al,10       ; cambio de linea
	call putchar

	mov eax, 1
	int 0x80 



section	.data
N	db 0 