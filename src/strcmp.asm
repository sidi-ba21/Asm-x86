BITS 64
section .text
    GLOBAL strcmp

; int strcmp(const char *s1, const char *s2);

strcmp:
    push rbp
    mov rbp, rsp
    xor rcx, rcx

loop_on_str:
    mov byte cl, [rdi + rcx]
    mov byte ch, [rsi + rcx]
    inc rcx                     ; move to next character of the string
    cmp cl, 0
    je if_equal
    cmp  cl, ch       ; check if current characters are equal
    je loop_on_str             ; loop if ZF = 1
    jl greater_end
    jg less_end

if_equal:
    cmp ch, 0
    jne greater_end
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