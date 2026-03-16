SECTION .text
global print_string

; ---------------------------------
; print_string
; Entrada:
;   EAX = direccion de cadena
;   cadena terminada en 0
; ---------------------------------

print_string:
    ;Inicio de nuestra funcion, prologo. 
    push ebp
    mov ebp, esp

    ;Guardamos la dirección de la cadena.
    mov esi, eax; ESI corresponde a la direccion de cadena.

    ;Calculamos la longitud de la cadena.
    xor ecx, ecx; Sera nuestro contador de longitud.

.loop_count:
    mov dl, [esi + ecx]; dl es igual al byte en posicion, esi + ecx
    cmp dl, 0; Compara si es igual a 0 la longitud
    je .end_count; Salimos del loop
    inc ecx; Incrementamos el contador.
    jmp .loop_count; Volvemos al inicio del loop.

.end_count:
    ;Aqui lo que hacemos es que ecx = longitud de la cadena.
    ; ESI = la dirección de la cadena.

    ;Syscall
    mov eax, 4; Syscall write
    mov ebx, 1; stdout Standar = std
    mov edx, ecx; edx = longitud
    mov ecx, esi; ECX = direccion de la cadena
    int 0x80

    ;Aqui ya es el epilogo, el fin de la funcion pues.

    mov esp, ebp
    pop ebp
    ret
