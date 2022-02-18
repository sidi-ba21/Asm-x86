BITS 64
section .text
    GLOBAL strspn

;   size_t strspn(const char *s, const char *accept);

strspn:
    push rbp
	mov rbp, rsp
	mov rdx, rdi
    xor rcx, rcx
	jmp loop

search_loop:
	cmp BYTE [r8], 0
	je end
	mov al, [rdx]
	cmp [r8], al
	je increment
	inc r8
	jmp search_loop

loop:
	cmp BYTE [rdx], 0
	je end
	mov r8, rsi
	jmp search_loop

increment:
	inc rdx
    inc rcx
	jmp loop

end:
    mov rax, rcx
	mov rsp, rbp
	pop rbp
	ret