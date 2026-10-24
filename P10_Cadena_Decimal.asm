; Materia: Lenguajes de Interfaz
; Alumno: Eber Angulo Ramirez
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 10. Obtención de una cadena decimal
; Descripción: Conversión de valores numéricos a cadena decimal con subrutina.

INCLUDE Irvine32.inc

.data
    tamArchivo DWORD 100000
    bloques DWORD 125
    tamBloque DWORD 512
    descargados DWORD ?
    msg1 BYTE "Bytes descargados: ",0
    buffer BYTE 11 DUP(0)

.code
convertirDecimal PROC
    push eax            ; guardo los registros en la pila para no perder sus valores
    push ebx
    push ecx
    push edx
    push edi

    mov edi, esi        ; posiciono el índice al final del buffer
    add edi, 10
    mov BYTE PTR [edi], 00h ; pongo el fin de cadena
    mov ebx, 10         ; divisor 10 para separar los dígitos

    cmp eax, 0          ; reviso si el número es cero
    jne convertir
    dec edi
    mov BYTE PTR [edi], '0' ; si es cero, pongo el carácter '0'
    jmp terminado

convertir:
    xor edx, edx        ; limpio edx antes de la división
    div ebx             ; divido entre 10 (el residuo queda en edx)
    add dl, '0'         ; convierto el residuo a su valor en ASCII
    dec edi             ; me muevo una posición atrás en el buffer
    mov [edi], dl       ; guardo el dígito convertido
    cmp eax, 0          ; sigo si aún quedan dígitos
    jne convertir

terminado:
    mov esi, edi        ; preparo para acomodar la cadena al inicio
    mov ecx, 0
contar:
    cmp BYTE PTR ecx, 0
    je copiarInicio
    inc ecx
    jmp contar

copiarInicio:
    mov edi, OFFSET buffer ; copio el resultado final al buffer principal
    inc ecx
    cld
    rep movsb

    pop edi             ; restauro los registros originales
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret                 ; regreso al programa principal
convertirDecimal ENDP

main PROC
    mov eax, bloques    ; multiplico los bloques por el tamaño de cada bloque
    mul tamBloque
    mov descargados, eax 	; guardo el total de bytes descargados

    mov edx, OFFSET msg1 	; preparo el mensaje para imprimir
    call WriteString
    mov eax, descargados 	; paso el número a eax
    mov esi, OFFSET buffer 	; paso el buffer donde se convertirá
    call convertirDecimal 	; llamo a la subrutina para convertir a texto
    mov edx, OFFSET buffer 	; imprimo el resultado convertido
    call WriteString
    call Crlf           ; salto de línea

    exit                ; finalizo el programa
main ENDP
END main