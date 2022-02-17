BITS 64
section .text
    GLOBAL strcasecmp

; int strcasecmp(const char *s1, const char *s2);

strcasecmp:
    push rbp
    mov rbp, rsp
    xor rcx, rcx

init_chr:
    mov r8b, byte [rdi + rcx]
    mov r9b, byte [rsi + rcx]

to_lower_src:       ; check if uppercase
    cmp r8b, 65
    jl to_lower_dest
    cmp r8b, 90
    jle change_chr_src
    
to_lower_dest:      ; check if uppercase
    cmp r9b, 65
    jl loop
    cmp r9b, 90
    jle change_chr_dest
    jmp loop

change_chr_src:     ; change src chr to lowercase
    add r8b, 32
    jmp to_lower_dest

change_chr_dest:    ; change dest chr to lowercase
    add r9b, 32

loop:
    inc rcx                     ; move to next character of the string
    cmp r8b, 0
    je set_return
    cmp  r8b, r9b      ; check if current characters are equal
    je init_chr             ; loop if ZF = 1

set_return:
    mov al, r8b
    sub al, r9b
    movsx rax, al
    jmp end

end:
    mov rsp, rbp
    pop rbp
    ret