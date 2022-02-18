BITS 64
section .text
    GLOBAL strcspn

;   size_t strcspn(const char *s, const char *reject);

strcspn:
	push rbp
	mov rbp, rsp
	mov rdx, rdi
    xor rcx, rcx
	jmp loop

search_loop:
	cmp BYTE [r8], 0
	je increment
	mov al, [rdx]
	cmp [r8], al
	je end
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