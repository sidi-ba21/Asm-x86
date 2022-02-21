BITS 64
section .text
    GLOBAL memcpy

;   void *memcpy(void *dest, const void *src, size_t n);

memcpy:
    push rbp
    mov rbp, rsp
    mov rax, rdi
    mov rcx, rdx
    cmp rdx, 0
    je return_dest
    dec rcx

loop:
    cmp rcx, 0
    jl return_dest
    mov r8b, byte [rsi + rcx] ; copy byte src into dest
    mov byte [rdi + rcx], r8b; 
    dec rcx
    jmp loop

return_dest:
    mov rsp, rbp
    pop rbp
    ret