BITS 64
section .text
    GLOBAL write

;   ssize_t write(int fildes, const void *buf, size_t nbyte);

write:
    mov rax, 0x01
    syscall
    ret