; Materia: Lenguajes de Interfaz
; Alumno: Eber Angulo Ramirez
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 3. Comparación y prueba
; Descripción: Compara dos números iguales usando JE y banderas.

INCLUDE Irvine32.inc

.data
    msgDiferentes BYTE "Los numeros son diferentes", 0
    msgiguales BYTE "Los numeros son iguales", 0

.code
main PROC
	mov eax, 10         ; Carga 10 en EAX
	mov ebx, 10         ; Carga 10 en EBX
	
	cmp eax, ebx        ; Compara EAX y EBX

	je iguales          ; Salta si son iguales (ZF=1)

	mov edx, OFFSET msgDiferentes
	call WriteString	; Muestra el mensaje que son diferentes

	jmp fin
	
iguales:
	mov edx, OFFSET msgiguales  
	call WriteString	; Muestra el mensaje que son iguales

fin:
	call Crlf
	exit

main ENDP
END main
