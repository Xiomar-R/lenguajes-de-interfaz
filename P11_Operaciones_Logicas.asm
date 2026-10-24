; Materia: Lenguajes de Interfaz
; Alumno: Eber Angulo Ramirez
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 11. Operaciones lógicas
; Descripción: Operaciones lógicas AND, OR para consultar y modificar estados de bits.

INCLUDE Irvine32.inc

.data
    

.code
main PROC
    ; 0 - encendido
    ; 1 - Alarma
    ; 2 - conectada
    ; estado inicial: 00000101

    ; 1 - AND: Extraer el estado de encendido
    mov eax, 0          ; limpio el registro eax
    mov ebx, 0          ; limpio el registro ebx
    mov al, 00000101b   ; cargo el estado inicial en al
    mov bl, al          ; lo copio a bl para trabajar con él
    and bl, 00000001b   ; uso AND como máscara para aislar el bit de encendido

    call dumpRegs       ; despliego los registros para ver el resultado
    nop

    ; 1 - OR: Encender la alarma
    mov al, 00000101b   ; vuelvo a cargar el estado inicial en al
    or al, 00000010b    ; uso OR para prender el bit de la alarma sin afectar los demás

    call dumpRegs       ; muestro los registros actualizados
    nop 
    exit                ; termino el programa

main ENDP

END main