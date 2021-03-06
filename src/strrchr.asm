BITS 64
section .text
    GLOBAL strrchr

;   char *strrchr(const char *s, int c);

strrchr:
    push rbp
    mov rbp, rsp
    cmp rdi, 0
    je return_null
    xor rax, rax

loop_on_str:
    cmp byte [rdi], sil     ; check if current character is equal to character given in parameter
    CMOVE rax, rdi          ; store pos_adress if ZF = 1

    cmp byte [rdi], 0       ; test end of string
    je return_pos_address   ; go to end

    inc rdi                 ; move to next character of the string
    jmp loop_on_str

return_pos_address:
    mov rsp, rbp
    pop rbp
    ret

return_null:
    mov rax, 0
    mov rsp, rbp
    pop rbp
    ret