BITS 64
section .text
    GLOBAL my_strlen

my_strlen:  
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
