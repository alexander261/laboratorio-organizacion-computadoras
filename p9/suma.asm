section .text

global suma

suma:     push ebp
    
    ;nasm -f elf suma.asm
    
    mov ebp,esp
    mov eax,[ebp + 8]
    mov ecx,[ebp + 12]

    add eax,ecx
    ;mov eax,10
fin: pop ebp
    ret