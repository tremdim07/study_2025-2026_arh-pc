%include 'in_out.asm'

section .data
msg_x: db 'Введите значение x: ',0
msg_a: db 'Введите значение a: ',0
rem: db 'Результат ',0

section .bss
x: resb 80
a: resb 80


section .text
global _start
_start:

mov eax,msg_x
call sprint
mov ecx,x
mov edx,80
call sread
mov eax,x
call atoi
mov edi,eax

mov eax,msg_a
call sprint
mov ecx,a
mov edx,80
call sread
mov eax,a
call atoi
mov esi,eax

cmp edi,esi
jle add_values
mov eax,esi
jmp print_result

add_values:
mov eax,edi
add eax,esi

print_result:
mov edi,eax
mov eax,rem
call sprint
mov eax,edi
call iprintLF
call quit
