BITS 64
section .text
    GLOBAL strstr

;   char *strstr(const char *haystack, const char *needle);

strstr:
	push rbp
	mov rbp, rsp
    cmp rdi, 0
    je not_found
    cmp rsi, 0
    je not_found
	jmp reset_count
start:
	cmp al, 0
	je not_found
	inc rdi

reset_count:
	mov al, [rdi]
	mov al, [rsi]
	xor rcx, rcx
	
loop:
	mov al, [rdi + rcx]
	mov r8b, [rsi + rcx]
	cmp r8b, 0
	jz found
	cmp al, r8b
	jne start
	inc rcx
	jmp loop

found:
	mov rax, rdi
	jmp end

not_found:
	xor rax, rax
	
end:	
	mov rsp, rbp
	pop rbp
	ret