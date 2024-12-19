global _start
section .data
    array db 8,5,3,6,7,12
    arraylen equ 6
    msg db 'My array sum is: ', 0
    msglen equ $-msg
    filename db 'lab5_4', 0
    fract_part db '.5', 0
    fractlen equ $-fract_part

section .bss
    buffer resb 20

section .text
itoa:
    push ebp
    mov ebp, esp
    sub esp, 8
    mov eax, [ebp+8]
    lea edi, [buffer+20]
    mov ecx, 10
    mov dword [ebp-8], 0

.divloop:
    xor edx, edx
    idiv ecx
    add edx, '0'
    dec edi
    mov [edi], dl
    inc dword [ebp-8]
    cmp eax, 0
    jnz .divloop
    mov eax, edi
    mov ecx, [ebp-8]
    leave
    ret

_start:
    mov eax, arraylen
    xor ebx, ebx
    lea ecx, array
    xor edi, edi
    
startloop:
    cmp ebx, eax
    je endloop
    xor edx, edx
    mov dl, [ecx + ebx]
    add edi, edx
    inc ebx
    jmp startloop

endloop:
    mov eax, edi
    mov edx, 0
    mov ecx, 2
    div ecx

    push eax
    call itoa
    add esp, 4

    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msglen
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, 20
    int 0x80

    cmp edx, 0
    je skip_fraction
    mov eax, 4
    mov ebx, 1
    mov ecx, fract_part
    mov edx, fractlen
    int 0x80

skip_fraction:
    mov eax, 8
    mov ebx, filename
    mov ecx, 0o600
    int 0x80

    mov eax, 15
    mov ebx, filename
    mov ecx, 0o647
    int 0x80  

    mov eax, 356
    mov ebx, filename
    mov ecx, 1
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80