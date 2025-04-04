%include "../LIB/pc_iox.inc"

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point

    ;--------------------------------------INCISO A
    
    mov ebx, 0x5C4B2A60
    add ebx, 0x02207511

	mov eax,ebx
	call pHex_dw

	mov ebx,eax



	mov al,10
	call putchar
    ;--------------------------------------INCISO B.


    push bx

    pop ax
    movzx eax, ax
    call pHex_w

    push bx

	mov al,10
	call putchar
    ;--------------------------------------INCISO C


    mov al, bl

    ;limpiar AH para multiplicar sin signo
    mov ah, 0
    mov cl, 8
    
    ; AL * CL  el resultado se guardaa en AX
    mul cl


    mov [N], ax


    movzx eax, word [N]
    call pHex_w



	mov al,10
	call putchar
    ;--------------------------------------INCISO D

    inc word [N]
    
    movzx eax, word [N]
    call pHex_w


	mov al,10
	call putchar

    ;--------------------------------------INCISO E



    mov ax, bx 
    mov cl, 0xFF 

    ; AX / CL 
    ;el valor se almacena en AL = cociente y AH = residuo
    div cl                 

    ;El cociente ya está en AL
    call pHex_b


    mov al,10
	call putchar


    ;el residuo está en AH
    mov al, ah
    call pHex_b


    mov al,10
	call putchar
    ;--------------------------------------INCISO F

    movzx ax, word [N]
    add al, ah

    mov [N], ax

    dec word [N]


	mov al,10
	call putchar
    ;--------------------------------------INCISO G

    pop ax


	mov al,10
	call putchar

	mov eax, 1
	int 0x80 



section	.data
N	dw 0 
