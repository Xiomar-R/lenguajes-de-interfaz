; Materia: Lenguajes de Interfaz
; Alumno: Eber Angulo Ramirez
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 5.1 Repetir hasta que el usuario ingrese cero
; Descripción: Ciclo condicional que solicita números hasta recibir un cero.

INCLUDE Irvine32.inc

.data

.code
main PROC
ciclo:
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    call Crlf

	cmp eax, 0          ; Compara EAX con 0
	jne ciclo           ; Si no es cero, repite

	exit

main ENDP
END main
