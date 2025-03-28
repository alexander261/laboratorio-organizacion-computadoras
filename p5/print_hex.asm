%include "../LIB/pc_iox.inc"

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point

	mov al,100
	call pHex_b	; muestra en pantalla 64

	mov al,10	; cambio de linea
	call putchar

	mov ax,0x12ab 	; presenta en pantalla 12AB
	call pHex_w

	mov al,10 	; cambio de linea
	call putchar

	mov eax,1234ABCDh ; presenta en pantalla 1234ABCD
	call pHex_dw

	mov al,0x0a	  ; cambio de lines 10 decimal o bien 0A hex
	call putchar

	mov eax,0x76543210 ; presenta en pantalla 76543210
        call pHex_dw

	mov al,10       ; cambio de linea
	call putchar

	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel
