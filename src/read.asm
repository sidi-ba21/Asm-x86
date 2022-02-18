BITS 64
section .text
    GLOBAL read

;   ssize_t read(int fildes, void *buf, size_t nbyte);

read:
    mov rax, 0x00
    syscall
    ret