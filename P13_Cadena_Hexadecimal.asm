; Materia: Lenguajes de Interfaz
; Alumno: Eber Angulo Ramirez
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 13. Obtención de una cadena hexadecimal
; Descripción: Conversión de valor numérico a cadena hexadecimal usando máscaras y desplazamientos.

INCLUDE Irvine32.inc

.data
    bufferHex BYTE 9 DUP(0)

.code
main PROC
    mov eax, 0          ; limpio los registros para empezar limpio
    mov ebx, 0
    mov ecx, 0
    mov edx, 0

    mov eax, 2ab34cd0h  ; cargo el número hexadecimal que quiero convertir
    mov esi, 7          ; pongo el índice en 7 para empezar a llenar el buffer de derecha a izquierda
    mov ecx, 8          ; contador de 8 iteraciones 

L1:
    mov ebx, eax        ; copio el valor a ebx para trabajar con él
    and ebx, 0Fh        ; uso una máscara con 0Fh para aislar el último dígito hexadecimal

    cmp ebx, 10         ; comparo si el dígito es mayor o igual a 10
    jl EsNumero         ; si es menor a 10, salta directo a la etiqueta EsNumero
    add ebx, 7          ; si es letra (A-F), le sumo 7 para ajustar su código ASCII

EsNumero:
    add ebx, '0'        ; convierto el valor numérico a su carácter ASCII correspondiente
    mov bufferHex[esi], bl ; guardo el carácter en la posición actual del buffer
    shr eax, 4          ; desplazo 4 bits a la derecha para procesar el siguiente dígito

    dec esi             ; muevo el índice hacia la izquierda
    loop L1             ; repito el ciclo hasta terminar los 8 dígitos

    mov edx, OFFSET bufferHex ; preparo la cadena hexadecimal ya convertida
    call WriteString    ; la imprimo en pantalla
    call Crlf           ; salto de línea

    call DumpRegs       ; muestro el estado de los registros
    exit                ; termino el programa

main ENDP

END main