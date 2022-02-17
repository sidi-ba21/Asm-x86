BITS 64
section .text
    GLOBAL strncmp

; int strncmp(const char *s1, const char *s2, size_t n);

strncmp:
    push rbp
    mov rbp, rsp
    xor rcx, rcx

loop_on_str:
    cmp rcx, rdx
    je equal
    mov byte cl, [rdi + rcx]
    mov byte ch, [rsi + rcx]
    inc rcx                     ; move to next character of the string
    cmp  cl, ch       ; check if current characters are equal
    je loop_on_str             ; loop if ZF = 1
    jl greater_end
    jg less_end

equal:
    xor rax, rax
    jmp end

greater_end:
    mov rax, 1
    jmp end

less_end:
    mov rax, -1

end:
    mov rsp, rbp
    pop rbp
    ret