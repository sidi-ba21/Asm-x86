BITS 64
section .text
    GLOBAL strcmp

;   int strcmp(const char *s1, const char *s2);

strcmp:
    push rbp
    mov rbp, rsp
    xor rcx, rcx
    cmp rdi, 0
    je if_null1
    cmp rsi, 0
    je if_null2

loop_on_str:
    mov al, [rdi + rcx]
    mov ah, [rsi + rcx]
    inc rcx                     ; move to next character of the string
    cmp al, 0
    je if_equal
    cmp  al, ah       ; check if current characters are equal
    je loop_on_str             ; loop if ZF = 1
    jg greater_end
    jl less_end

if_equal:
    cmp ah, 0
    jne less_end
    xor rax, rax
    jmp end

greater_end:
    mov rax, 1
    jmp end

less_end:
    mov rax, -1
    jmp end

if_null1:
    cmp rsi, 0
    jne less_end
    jmp end

if_null2:
    cmp rdi, 0
    jne greater_end

end:
    mov rsp, rbp
    pop rbp
    ret