global _start

section .text
_start:
   push rbp
   mov rbp, rsp
   sub rsp, 0x10
   mov rax, 0
   mov rdi, 1
   lea rsi, [rbp-0x10]
   mov rdx, 0x10
   syscall

   mov al, byte [rbp-0x10]
   sub al, 0x30
   mov r15, rax
   mov r10, rax   ; r10: number
   mov bl, 2
   div bl

   cmp ah, 0   ; ah: remainder
   je FIN

for1:
   cmp r15, 0   ; r15: i
   je FIN

   mov rax, r10
   sub rax, r15
   mov r14, rax
   inc r14
for2:
   cmp r14, 0   ; r14: j
   je end2

   mov rax, 1
   mov rdi, 1
   mov rsi, star
   mov rdx, 0x1
   syscall

   dec r14
   jmp for2
end2:
   dec r15
   mov rax, 1
   mov rdi, 1
   mov rsi, line
   mov rdx, 0x1
   syscall
   jmp for1

FIN:
   mov al, 60
   xor rdi, rdi
   syscall

section .data
line: db 10, 0   ; 0x0a
star: db "*", 0   ; 0x2a

