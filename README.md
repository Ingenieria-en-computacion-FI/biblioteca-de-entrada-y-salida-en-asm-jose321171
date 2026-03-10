[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/2e3MkAMN)
[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-2e0aaae1b6195c2367325f4f02e2d04e9abb55f0b24a779b69b11b9e10269abc.svg)](https://classroom.github.com/online_ide?assignment_repo_id=23050742&assignment_repo_type=AssignmentRepo)
# IA-32 Input/Output Library

Biblioteca simple de entrada y salida en ensamblador IA-32.

## Funciones disponibles

Implementadas:

- print_int
- scan_int

Por implementar:

- print_char
- scan_char
- print_string
- scan_string
- newline

## Ensamblar y enlazar

nasm -f elf32 scan_int.asm -o scan_int.o
nasm -f elf32 print_int.asm -o print_int.o
nasm -f elf32 scan_char.asm -o scan_char.o
nasm -f elf32 print_char.asm -o print_char.o
nasm -f elf32 scan_string.asm -o scan_string.o
nasm -f elf32 print_string.asm -o print_string.o
nasm -f elf32 newline.asm -o newline.o
nasm -f elf32 main.asm -o main.o

ld -m elf_i386 scan_int.o print_int.o scan_char.o print_char.o print_string.o scan_string.o newline.o main.o -o programa
## Ejecutar

./program
