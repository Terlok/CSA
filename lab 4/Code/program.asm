global start
NULL equ 0
MB_OK equ 0
     extern MessageBoxA
     extern ExitProcess

section .data
    a1 equ 12
    a2 equ 6
    a3 equ 17
    c1 equ 23
    c2 equ 16
    text: db 'rcx: ',0
    title: db 'Result',0

section .bss
    numbuf resb 20

section .text

itoa:
    push rbp
    mov rbp,rsp
    sub rsp,8
    mov rax,rcx
    lea rdi,[numbuf+10]
    mov rcx,10
    mov qword [rbp-8],0

.divloop:
    xor rdx,rdx
    idiv rcx
    add rdx,0x30
    dec rdi
    mov byte [rdi],dl
    inc qword [rbp-8]
    cmp rax,0
    jnz .divloop
    mov rax,rdi
    leave
    ret

start:
     mov rax, a1
     add rax, a3
     sub rax, a2
     push rax
     mov rdx, 0
     mov rax, a1
     mov rbx, a2
     div rbx
     mov rbx, rax
     pop rax
     mov rcx, c1
     add rcx, c2
     mov rdx, a1
     rcr rdx, 4
loop:
     cmp rcx, 5
     jl loopend
     sub rcx, 5
     add rbx, rax
     sub rbx, rcx
     jmp loop

loopend:
     call itoa
     mov rcx, rbx
     mov rbx, [rax]
     mov [text+5], rbx
     sub rsp, 40
     mov r9, MB_OK
     mov r8, title
     mov rdx, text
     mov rcx, NULL
     call MessageBoxA

quit:
     xor rcx, rcx
     call ExitProcess