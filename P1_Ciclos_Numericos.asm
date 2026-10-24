; Materia: Lenguajes de Interfaz unidad 2
; Alumno: Eber Angulo Ramirez
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 1. Ciclos numéricos
; Descripción: Ciclo numérico simple usando ECX y LOOP.

INCLUDE Irvine32.inc

.data

.code
main PROC
	mov ecx, 5          ; Inicializa el contador en 5

ciclo:
	mov eax, ecx        ; Pasa el valor de ECX a EAX
	call WriteDec       ; Imprime el número decimal
	

	loop ciclo          ; Decrementa ECX y salta si no es cero
	
	exit 

main ENOP
END main
