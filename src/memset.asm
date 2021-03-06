BITS 64
section .text
    GLOBAL memset

;   void *memset(void *s, int c, size_t n);

memset:
    push rbp
    mov rbp, rsp
    mov rax, rdi         ; store adress rdi in r8

loop:
    cmp rdx, 0
    je return_dest
    mov byte [rdi], sil
    dec rdx
    inc rdi
    jmp loop

return_dest:
    mov rsp, rbp
    pop rbp
    ret