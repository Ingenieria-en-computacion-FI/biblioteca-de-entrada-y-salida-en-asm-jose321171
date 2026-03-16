SECTION .text
global print_char

; ---------------------------------
; print_char
; Entrada:
;   AL = caracter a imprimir
; ---------------------------------

print_char:

    push ebp
    mov ebp, esp

    ; Obtener el caracter del parametro mov al, [ebp+8]
    ; 1. Guardar el caracter en memoria (en la pila)

    sub esp, 4; Quitamos 4 del stack pointer, que es lo mismo que reservar espacio, 4 bytes.
    mov byte [esp], al; Guardamos el caracter en esa dirección

    ; 2. Usar syscall write
    mov eax, 4; "Lo va a escribir"
    mov ebx, 1;  "Escribe en pantalla"
    mov ecx, esp; "Aquí está el caracter"
    mov edx, 1; "Escribe 1 byte unicamente" sjjs.
    
    ; Ejecutamos el syscall
    int 0x80; El SO se encarga de hacer lo que le pedimos. 

    ; Limpiamos la pila
    add esp, 4; Limpiamos los 4 bytes que reservamos en el paso 1.

    ; write(fd=1, buffer, 1)

    mov esp, ebp
    pop ebp
    ret
