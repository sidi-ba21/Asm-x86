BITS 64
section .text
    GLOBAL memcpy

; void *memcpy(void *dest, const void *src, size_t n);

memcpy:
    push rbp
    mov rbp, rsp
    mov r8, rdi         ; store adress rdi in r8

loop_cpy:
    cmp rdx, 0
    je return_dest
    mov r9b, byte [rsi] ; copy byte src into dest
    mov byte [rdi], r9b ; 
    dec rdx
    inc rsi
    inc rdi
    jmp loop_cpy

return_dest:
    mov rax, r8     ; set return to adress r8
    mov rsp, rbp
    pop rbp
    ret