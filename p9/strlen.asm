section .text

global strlen

strlen:     push ebp
    
    ;nasm -f elf strlen.asm
    
    mov ebp,esp

    mov eax,[ebp + 8]
    mov esi,0

    CICLO:
        cmp eax,"\0"
            je fin
        
        add ebx,4
        mov eax,[ebp + 12]
        add esi,1
        jmp CICLO
    mov eax,ebp

fin:            pop ebp
    ret