BITS 64
section .text
    GLOBAL index

;   char* index(const char *str, int c);
;   same as strchr

index:
    push rbp
    mov rbp, rsp
    cmp rdi, 0
    je return_null

loop_on_str:
    cmp byte [rdi], sil ; check if current character is equal to character given in parameter
    je return_pos_address   ; go to end

    cmp byte [rdi], 0  ; test end of string
    je return_null     ; go to end

    inc rdi         ; move to next character of the string
    jmp loop_on_str         ; loop

return_pos_address:
    mov rax, rdi            ; set function return
    mov rsp, rbp
    pop rbp
    ret

return_null:
    mov rax, 0
    mov rsp, rbp
    pop rbp
    ret