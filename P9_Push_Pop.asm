; Materia: Lenguajes de Interfaz
; Alumno: Eber Angulo Ramirez
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 9. PUSH y POP
; Descripción: Manejo de la pila LIFO, registros y llamadas con CALL/RET.

INCLUDE Irvine32.inc

.data

.code
main PROC
	; BLOQUE 1: PUSH Y POP
	mov eax, 500

	push eax            ; meto 500 a la pila
	nop

	mov ebx, 0
	pop ebx             ; saco el valor de la pila y lo guardo en ebx

	nop

	; BLOQUE 2: ORDEN LIFO
	mov eax, 10
	push eax            ; meto el 10

	mov eax, 20
	push eax            ; meto el 20

	mov eax, 30
	push eax            ; meto el 30

	nop

	pop eax             ; sale primero el 30
	pop ebx             ; luego sale el 20
	pop ecx             ; y al último sale el 10
	
	nop

	; BLOQUE 3: CONSERVAR REGISTROS
	mov eax, 100
	mov ebx, 200

	push eax            ; guardo los valores originales en la pila
	push ebx

	mov eax, 999
	mov ebx, 888        ; cambio temporalmente los registros

	pop ebx             ; recupero el valor original de ebx
	pop eax             ; recupero el valor original de eax

	nop

	; BLOQUE 4: CALL Y RET
	mov eax, 50
	mov ebx, 666

	call aumentarDiez   ; llamo al procedimiento para sumar

	nop

	exit

main ENDP

aumentarDiez PROC
	nop
	push ebx            ; guardo ebx en la pila para no alterarlo

	nop
	mov ebx, 10
	add eax, ebx        ; le sumo 10 a eax
	
	nop
	pop ebx             ; restauro el valor original de ebx

	nop
	ret                 ; regreso al programa principal
aumentarDiez ENDP
END main