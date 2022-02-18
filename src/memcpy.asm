BITS 64
section .text
    GLOBAL memcpy

;   void *memcpy(void *dest, const void *src, size_t n);

memcpy:
    push rbp
    mov rbp, rsp
    mov rax, rdi
    dec rdx

loop:
    cmp rdx, 0
    jl return_dest
    mov r8b, byte [rsi + rdx] ; copy byte src into dest
    mov byte [rdi + rdx], r8b; 
    dec rdx
    jmp loop

return_dest:
    mov rsp, rbp
    pop rbp
    ret