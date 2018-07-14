global _start

section .bss
buffer resb 128

section .data
fmt :    db "%s", 0
cr :   db "", 10, 0
gufmt :   db "%d * %d = %d", 0
menu :   db "Choose menu: 1 or 2", 0
Gunum:    db "Choose number: 1 ~ 9", 0
one :   db "ONE!!", 0
two :    db "TWO!!", 0

section .text
   extern printf
   extern scanf
   extern exit

_start:
   push rbp
   mov rsi, menu
   mov rdi, fmt
   mov rax, 0
   call printf
   mov rdi, cr
   mov rax, 0
   call printf

   mov rsi, buffer
   mov rdi, fmt
   mov rax, 0
   call scanf
   mov eax, [buffer]
   sub eax, 0x30
   cmp eax, 2
   je TWO
ONE:
   mov r14, 1   ; r14: i
   mov r15, 1   ; r15; j
for1:
   cmp r14, 20
   je FIN

for2:
   cmp r15, 10
   je end2

   mov rax, r14
   mul r15
   mov r13, rax   ; r13: result

   mov rdi, gufmt
   mov rsi, r14
   mov rdx, r15
   mov rcx, r13
   mov rax, 0
   call printf
   mov rdi, cr
   mov rax, 0
   call printf

   inc r15
   jmp for2
end2:
   mov r15, 1
   inc r14
   mov rdi, cr
        mov rax, 0
        call printf
   jmp for1

TWO:
        mov rsi, Gunum
        mov rdi, fmt
        mov rax, 0
        call printf
        mov rdi, cr
        mov rax, 0
   call printf
        mov rsi, buffer
        mov rdi, fmt
        mov rax, 0
        call scanf
        mov rax, [buffer]
        sub rax, 0x30
        mov r14, rax
   mov r15, 1

for3:
        cmp r15, 20
        je FIN

        mov rax, r14
        mul r15
        mov r13, rax    ; r13: result

        mov rdi, gufmt
        mov rsi, r14
        mov rdx, r15
        mov rcx, r13
        mov rax, 0
        call printf
        mov rdi, cr
        mov rax, 0
        call printf

        inc r15
        jmp for3
         
FIN:
   call exit
   pop rbp
   ret
   
