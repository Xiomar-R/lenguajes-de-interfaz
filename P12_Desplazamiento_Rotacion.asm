; Materia: Lenguajes de Interfaz
; Alumno: Eber Angulo Ramirez
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 12. Desplazamiento y rotación
; Descripción: Instrucciones de desplazamiento de bits SHL, SHR y SAR conservando signo.

INCLUDE Irvine32.inc

.data
    

.code
main PROC
    mov eax, 0          ; limpio todos los registros principales para empezar desde cero
    mov ebx, 0
    mov ecx, 0
    mov edx, 0

    ; 1 SHL - Desplazar una pocicion a la izquierda
    mov al, 10000000b   ; cargo un valor binario en al
    shl al, 1           ; desplazo los bits una posición hacia la izquierda

    call DumpRegs       ; muestro cómo quedaron los registros
    call WriteBin       ; imprimo el resultado en binario
    
    ; 2 - SHR ; DEZPLASAR UNA POCICION  A LA DERECHA
    mov al, 00001101b   ; cargo otro número en binario
    shr al, 1           ; desplazo una posición hacia la derecha
    
    call DumpRegs
    call WriteBin

    ; 3 - CONSERVAR EL SIGNO
    mov al, -8          ; cargo un número negativo 
    sar al, 1           ; desplazo a la derecha conservando el signo
    
    call DumpRegs
    call WriteBin

    ; 4 - SAR: CON OPERACIONES NO EXACTAS
    mov al, -9          ; cargo otro número negativo 
    sar al, 1           ; hago la operación con signo no exacta
    
    call DumpRegs
    call WriteBin

    ; 5 - Deconteo: despazar 2 bits acia la izquierda
    mov al, 00001111b   ; cargo un patrón de bits
    shl al, 2           ; desplazo dos bits hacia la izquierda

    call WriteBin
    call DumpRegs

    ; 6 - Desplazar 2 bits hacia la derecha utilizando CL
    mov al, 00001111b
    mov cl, 2           ; pongo la cantidad de posiciones en el registro cl
    shr al, cl          ; desplazo a la derecha usando el contador de cl
    
    call WriteBin
    call DumpRegs

    clc                 ; limpio la bandera de acarreo
    exit                ; termino el programa

main ENDP

END main