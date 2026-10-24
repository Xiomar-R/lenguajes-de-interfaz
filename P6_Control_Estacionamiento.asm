; Materia: Lenguajes de Interfaz
; Alumno: Eber Angulo Ramirez
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 6.1 Control de ocupación de un estacionamiento
; Descripción: Control de capacidad máxima de vehículos mediante incrementos.

INCLUDE Irvine32.inc

.data
	msgMax BYTE "Estacionamiento lleno", 0
    msgIngreso BYTE "Vehiculo ingresado. Espacios ocupados: ", 0
    limite EQU 20

.code
main PROC
	mov ebx, limite ; cargo el limite de autos permitidos en EBX
	mov ecx, 0      ; inicializo el contador de autos en cero

cicloEstacionamiento:
    cmp ecx, ebx    ; comparo cuántos autos hay con el limite
    jge máximo      ; si ya se alcanzó o pasó el límite salta a la etiqueta máximo

    inc ecx         ; le sumo uno al contador de vehículos
    mov edx, OFFSET msgIngreso ; preparo el mensaje de ingreso
    call WriteString
    mov eax, ecx    ; paso el número actual a EAX para imprimirlo
    call WriteDec
    call Crlf
    jmp cicloEstacionamiento ; repito el ciclo para el siguiente auto

máximo:
	mov edx, OFFSET msgMax ; cargo el mensaje de que el estacionamiento está lleno
	call WriteString
        call Crlf

fin:
	exit          
	
main ENDP
END main