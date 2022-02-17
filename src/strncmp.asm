BITS 64
section .text
    GLOBAL strncmp

; int strncmp(const char *s1, const char *s2, size_t n);

strncmp:
    push rbp
    mov rbp, rsp
    xor rcx, rcx
    cmp rdx, 0
    je equal
    cmp rdi, 0
    je if_null1
    cmp rsi, 0
    je if_null2

loop_on_str:
    cmp rcx, rdx
    je equal
    mov byte al, [rdi + rcx]
    mov byte ah, [rsi + rcx]
    inc rcx                     ; move to next character of the string
    cmp  al, ah       ; check if current characters are equal
    je loop_on_str             ; loop if ZF = 1
    jmp diff

equal:
    xor rax, rax
    jmp end

diff:
    sub al, ah
    movsx rax, al
    jmp end

if_null1:
    cmp rsi, 0
    je return_null

if_null2:
    cmp rdi, 0
    je return_null
    

return_null:
    xor rax, rax
    jmp end

end:
    mov rsp, rbp
    pop rbp
    ret