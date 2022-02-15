BITS 64
section .text
    GLOBAL strchr

strchr:
        push rbp
        mov rbp, rsp

loop_on_str:
        cmp byte [rdi], 0  ; test end of string
        je no_found     ; go to end

        cmp byte [rdi], sil ; check if current character is equal to character given in parameter
        je found_end   ; go to end

        inc rdi         ; move to next character of the string
        jmp loop_on_str         ; loop

found_end:
        mov rax, rdi            ; set function return
        mov rsp, rbp
        pop rbp
        ret

no_found:
        mov rax, 0
        mov rsp, rbp
        pop rbp
        ret