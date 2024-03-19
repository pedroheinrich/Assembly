%include 'Aula 01/bibliotecaE.inc'

;COMPILAR - transforma o programa em linguagem de maquina
;.nasm -f elf64 hello.nasm
;LINKEDIAR - transforma o programa em linguagem de maquina em executavel
;ld -s -o hello hello.o

section .data
    msg db 'Oi Pedro', 0xa ; constante msg + quebra de linha com o 10
    tam equ $ - msg ;tamanho da mensagem, constante msg

section .text

global _start

_start:
    mov eax, 0x4  ; avisa que quer fazer uma saida
    mov ebx, 0x1  ; avisa que a saida será na saida padrao
    mov ecx, msg  ; a mensagem 
    mov edx, tam  ; tamanho da mensagem
    int 0x80

    ;destino --- > origem
    mov eax, 0x1
    mov ebx, 0x0 ; avisa o SO que terminou a msg
    int 0x80 ; o programa pega toda a informação e executar ou preocessar