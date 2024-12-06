section .bss
    val_AX resd 1
    val_BX resd 1
    val_CX resd 1
    val_DX resd 1

section .data
    a db 8, 5, 3
    c1 db 20
    c2 db 6
    fmt db "Result: %d", 10, 0

section .text
    extern printf
    global main

main:
    push ebp
    mov ebp, esp

    ; AX = a(1) + a(2) - a(3)
    mov al, [a]
    add al, [a+1]
    sub al, [a+2]
    movzx eax, al
    mov [val_AX], eax
    
    ; BX = a(1) * a(2)
    mov al, [a]
    mov bl, [a+1]
    movzx eax, al
    movzx ebx, bl
    imul eax, ebx
    mov [val_BX], eax

    ; CX = c1 - c2
    mov al, [c1]
    sub al, [c2]
    movzx eax, al
    mov [val_CX], eax
    
    ; DX = ((c1 & a(2)), a(3))
    mov al, [c1]
    and al, [a+1]
    add al, [a+2]
    movzx eax, al
    mov [val_DX], eax
    
    ; Loop
loop_start:
    mov eax, [val_CX]
    cmp eax, 0
    je loop_end

    ; CX = CX - 1
    sub dword [val_CX], 1

    ; BX = BX - AX
    mov eax, [val_BX]
    sub eax, [val_AX]
    mov [val_BX], eax
    jmp loop_start

loop_end:
    push dword [val_BX]
    push fmt
    call printf
    add esp, 8

    leave
    ret