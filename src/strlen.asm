BITS 64
section .text
    GLOBAL strlen

; int strlen(char *str)

strlen:  
    push rbp
    mov rbp, rsp    ; setup the stack frame

    xor rax, rax    ; loop counter

    jmp loop

increment:
    inc rax         ; rax ++

loop:                 ; loop
    cmp [rdi + rax], BYTE 0     ; compare each octet to 0
    jne increment

end:
    mov rsp, rbp
    pop rbp
    ret             ; return rax
