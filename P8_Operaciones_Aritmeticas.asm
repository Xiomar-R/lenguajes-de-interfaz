; Materia: Lenguajes de Interfaz
; Alumno: Eber Angulo Ramirez
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 8. Operaciones aritméticas
; Descripción: Uso de ADD, SUB, MUL, DIV, IMUL, IDIV y banderas CF/OF.

INCLUDE Irvine32.inc

.data

.code
main PROC
	; OPERACIONES: ADD U SUB
	mov eax, 50
	mov ebx, 20
	
	add eax, ebx    ; aquí sumo 50 + 20
	sub eax, 15     ; y aquí le resto 15 al resultado

	nop             

	; 2. CF: ACARREO UNA SUMA SIN SIGNO
	mov eax, 0
	mov al, 255
	add al, 1       ; le sumo 1 a 255 para que se desborde y active el Carry Flag

	nop
	
	; 3, OF: CONDICION DE DESBORDAMIENTO
	mov eax, 0
	mov al, 127
	add al, 1       ; me paso del límite con signo para activar el Overflow

	nop

	; 4, NUL: MULTIPLICACIONES DE VALORES DENTRO DE 32 BITS
	mov eax, 25
	mov ebx, 3
	
	mul ebx         ; multiplico normal 25 por 3

	; 5, MUL: PRODUCTO QUE NESESITA MAS DE 32 BITS
	mov eax, 65537
	mov ebx, 65537

	mul ebx         ; aquí el resultado es más grande y ocupa más espacio

	nop

	; 6, INUL: MULTIPLICACION CON SIGNO
	mov eax, -5
	imul eax, eax, 3 ; hago la multiplicación usando números con signo

	; 7, DIV: DIVIDIENDO SIN SIGNO
	mov eax, 125
	mov edx, 0      ; limpio el registro EDX antes de dividir
	mov ebx, 12

	div ebx         ; divido sin signo

	nop

	; 8, IDIV: DICISION CON SIGNO
	mov eax, -125
	cdq             ; extiendo el signo en EDX
	mov ebx, 12

	idiv ebx        ; divido con número con signo

	nop
    exit

main ENDP
END main