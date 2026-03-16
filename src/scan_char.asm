SECTION .bss
char_buffer resb 1

SECTION .text
global scan_char

; ---------------------------------
; scan_char
; Salida:
;   AL = caracter leído
; ---------------------------------

scan_char:

    push ebp
    mov ebp, esp; Abrimos el stack frame

    mov eax, 3; Corresponde a syscall sys_read
    mov ebx, 0; Corresponde a leer desde stdin es decir, el teclado
    mov ecx, char_buffer; Direccion donde el kernl dejará el precioso byte.
    mov edx, 1; leer exactamente 1 byte.
    int 0x80; Llamamos al kernel

    mov al, [char_buffer] ; Traemos el byte de memoria a AL

    mov esp, ebp
    pop ebp
    ret
