BITS 64
section .text
    GLOBAL strcpy

;   char *strcpy(char *dest, const char *src);

strcpy:
    push rbp
    mov rbp, rsp
    xor rcx, rcx

loop:
    cmp byte [rsi + rdx], 0
    je return_dest
    mov al, byte [rsi + rcx] ; copy byte src into dest
    mov byte [rdi + rcx], al; 
    inc rcx
    jmp loop

return_dest:
    mov byte [rdi + rcx], 0
    mov rax, rdi
    mov rsp, rbp
    pop rbp
    ret