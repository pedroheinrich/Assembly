%include '/home/pedro/Documentos/Curso Assembly/Aula2/bibliotecaE.inc'

;COMPILAR - transforma o programa em linguagem de maquina
;.nasm -f elf64 hello.nasm
;LINKEDIAR - transforma o programa em linguagem de maquina em executavel
;ld -s -o hello hello.o

section .data
    msg db 'Entre com um valor de 3 dígitos: ', LF, NULL
    tam equ $ - msg
    parMsg db 'Número é PAR'
    tamPar equ $ - parMsg
    imparMsg db 'Número é ÍMPAR'
    tamImp equ $ - imparMsg

section .bss
    num resb 1

section .text

global _start

_start:

    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, msg
    mov edx, tam
    int SYS_CALL

entrada_valor:
    mov eax, SYS_READ
    mov ebx, STD_IN
    mov edx, num
    mov edx, 0x4
    int SYS_CALL

    lea esi, [num]
    mov ecx, 0x3

verificar: 
    mov edx, 0x0
    mov ebx, 0x2
    div ebx
    cmp edx, 0x0
    jz mostra_par

mostra_impar:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, imparMsg
    mov edx, tamImp
    jmp saida
    int SYS_CALL

mostra_par:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, parMsg
    mov edx, tamPar
    jmp saida
    int SYS_CALL

saida:
    mov eax, SYS_EXIT
    mov ebx, RET_EXIT 
    int SYS_CALL 