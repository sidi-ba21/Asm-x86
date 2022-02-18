BITS 64
section .text
    GLOBAL my_strpbrk

;   char *strpbrk(const char *s, const char *accept);

my_strpbrk:
	push rbp
	mov rbp, rsp
	mov rdx, rdi
	jmp loop

search_loop:
	cmp BYTE [r8], 0
	je increment
	mov al, [rdx]
	cmp [r8], al
	je found
	inc r8
	jmp search_loop

loop:
	cmp BYTE [rdx], 0
	je not_found
	mov r8, rsi
	jmp search_loop

increment:
	inc rdx
	jmp loop

found:
	mov rax, rdx
	jmp end

not_found:
	mov rax, 0

end:
	mov rsp, rbp
	pop rbp
	ret