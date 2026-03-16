extern print_char
global newline

SECTION .text

newline:

    push ebp
    mov ebp, esp

    ; TODO:
    ; imprimir '\n' ;

    mov eax, 10 ;10 es el codigo ASCII para "\n"
    push eax
    call print_char
    add esp, 4


    mov esp, ebp
    pop ebp
    ret
