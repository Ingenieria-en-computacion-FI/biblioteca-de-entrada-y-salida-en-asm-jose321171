SECTION .text
global scan_string

; ---------------------------------
; scan_string
; Entrada:
;   EAX = buffer destino
;   EBX = tamaño máximo
; ---------------------------------

scan_string:

    push ebp
    mov ebp, esp

    ;Salvaguardar los datos antes de que syscall los pise siquiera.
    push eax
    push ebx

    ;Preparamos el syscall read (0, buffer, tamaño)
    mov edx, ebx; Tamaño maximo antes de pisar ebx
    mov ecx, eax; Buffer -> ecx, claro, antes de pisar eax.
    mov eax, 3; sys_read
    mov ebx, 0; stdin, la entrada pues.
    int 0x80; eax = bytes leidos. s.o hagase tu voluntad.

    ;Luego de ello, eax contiene cuantos bytes se leyeron. Ocupamos poner un 0 justo al final de esos bytes.

    ;Aqui agregamos el terminador nulo "\0".
    pop ebx; Descartamos el tamaño. Es decir, limpiamos el stack
    pop ecx; Recuperamos la direccion del buffer

    add ecx, eax; ecx apunta justo despues del ultimo byte. Avanzamos al final de lo leido.
    mov byte [ecx], 0; Escribimos el termino nulo que es \0


    

    mov esp, ebp
    pop ebp
    ret
