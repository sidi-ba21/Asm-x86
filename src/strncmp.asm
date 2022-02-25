BITS 64
section .text
    GLOBAL strncmp

;   int strncmp(const char *s1, const char *s2, size_t n);

strncmp:
    push rbp
    mov rbp, rsp
    xor rcx, rcx

loop_on_str:
    cmp rcx, rdx
    je equal
    mov byte r8b, [rdi + rcx]
    mov byte r9b, [rsi + rcx]
    cmp r8b, 0
    je diff
    cmp r9b, 0
    je diff
    inc rcx                     ; move to next character of the string
    cmp  r8b, r9b       ; check if current characters are equal
    je loop_on_str             ; loop if ZF = 1
    jmp diff

equal:
    xor rax, rax
    jmp end

diff:
    sub r8b, r9b
    movsx rax, r8b
    jmp end

end:
    mov rsp, rbp
    pop rbp
    ret