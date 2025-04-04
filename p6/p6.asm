%include "../LIB/pc_iox.inc"
extern pbin.o

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point

    ;--------------------------------------INCISO A
    mov al, 0x12

	call pHex_b

    ;-------------SALTO DE LINEA
	mov al,10
	call putchar
    ;-------------

    mov al, 0x12
    rcl al,1


	call pHex_b
    ;--------------------------------------INCISO B

    
    ;-------------SALTO DE LINEA
	mov al,10
	call putchar
    ;-------------



    ;0xFA40
    mov cx,1h
    mov ax,cx
	call pHex_w


    ;-------------SALTO DE LINEA
	mov al,10
	call putchar
    ;-------------


    shl ax,1h
    call pHex_w



    ;-------------SALTO DE LINEA
	mov al,10
	call putchar
    ;-------------

    ;--------------------------------------INCISO C


    mov esi,0x20D685F3
    mov eax,esi
    not eax
    call pHex_dw

    ;-------------SALTO DE LINEA
	mov al,10
	call putchar
    ;-------------
    ;--------------------------------------INCISO D




    push eax
    pop eax

    call pHex_dw

    ;-------------SALTO DE LINEA
	mov al,10
	call putchar
    ;-------------

    ;--------------------------------------INCISO E

    mov ch,0xA7


    call pHex_w


    ;-------------SALTO DE LINEA
	mov al,10
	call putchar
    ;-------------

    ;--------------------------------------


	mov al,10
	call putchar


	mov eax, 1
	int 0x80 



section	.data

