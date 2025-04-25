%include "../LIB/pc_iox.inc"

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point

    ;nasm -f elf index2.asm && ld -m elf_i386 index2.o ../LIB/libpc_iox.a -o index2 && ./index2


    ;-------------------------------------------------------------------------------------------

    ;mov ebx,0x5C4B2A60
    mov ebx,0x12345678
    mov eax,0x1

    ;********************* SUMA DE 2 REGISTROS   EAX = EAX + EBX
    add eax,ebx


    call pHex_dw

    ;********************* GUARDAR LA SUMA EN "EBX"
    ;EBX = EAX
    mov ebx,eax

    ;********************* GUARDAR LA PARTE MENOS SIGNIFICATIVA DE "EBX" EN LA PILA
    push bx

    ;-------------------------------------------------------------------------------------------

	mov al,10
	call putchar

    ;-------------------------------------------------------------------------------------------

    ;*********************MULTIPLICACION DE   N = BL * 8
    mov al,1
    mul bl

    ;*********************GUARDAR EL VALOR DE LA MULTIPLICACION EN LA VARIABLE N
    mov [N],ax
    call pHex_w

    ;-------------------------------------------------------------------------------------------

	mov al,10
	call putchar

    ;-------------------------------------------------------------------------------------------

    ;*********************INCREMENTAMOS EN 1 LA VARIABLE N
    mov ax,[N]
    INC ax

    

    call pHex_w

    ;*********************GUARDAMOS EL INCREMENTO EN LA VARIABLE "N"
    mov [N],ax

    ;-------------------------------------------------------------------------------------------

	mov al,10
	call putchar

    ;-------------------------------------------------------------------------------------------


    mov ax, bx
    mov cl, 0xFF
    div cl

    ;IMPRIMIR CONCIENTE
    call pHex_b

    ;-------------------------------------------------------------------------------------------

	mov al,10
	call putchar

    ;-------------------------------------------------------------------------------------------

    ;IMPRIMIR RESIDUO
    mov al,ah
    call pHex_b

    ;GUARDAMOS EL VALOR EN AH PARA EL SALTO DE LINEA
    mov ah,al
    ;-------------------------------------------------------------------------------------------

	mov al,10
	call putchar

    ;-------------------------------------------------------------------------------------------

    ;SUMAMOS N + RESIDUO
    movzx bx,ah
    mov ax,[N]

    add ax,bx

    call pHex_w

    ;DECREMENTAMOS Y GUARDAMOS EN N
    DEC ax
    mov [N],ax

    ;-------------------------------------------------------------------------------------------

	mov al,10
	call putchar

    ;-------------------------------------------------------------------------------------------

    mov ax,[N]
    call pHex_w


    ;-------------------------------------------------------------------------------------------

	mov al,10
	call putchar

    ;-------------------------------------------------------------------------------------------

    ;SAMOS EL VALOR DE LA PILA
    pop ax
    call pHex_w

    ;-------------------------------------------------------------------------------------------

	mov al,10
	call putchar

    ;-------------------------------------------------------------------------------------------

	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel


section .data
N dw 0
