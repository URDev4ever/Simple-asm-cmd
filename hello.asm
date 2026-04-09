section .data
    msg db "Hello, assembly!", 0xA
    len equ $ - msg

section .text
    global _start

_start:
    mov eax, 1
    mov edi, 1
    lea rsi, [msg]
    mov edx, len
    syscall

    mov eax, 60
    xor edi, edi
    syscall
