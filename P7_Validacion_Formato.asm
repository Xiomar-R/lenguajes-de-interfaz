; Materia: Lenguajes de Interfaz
; Alumno: Eber Angulo Ramirez
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 7. Validación de formato
; Descripción: Validación de caracteres, letras (A-Z) y dígitos (0-9).

INCLUDE Irvine32.inc

.data
	msgvalido BYTE "LA CADENA CUMPLE CON LAS REGLAS ", 0
	msgNovalido BYTE "NO CUMPLE CON LAS REGLAS ", 0

.code
main PROC
    call WriteString 
    call Crif
    
    cmp eax, 7          ; aquí checo si la longitud es de 7 caracteres
    jne invalido        ; si no es 7, lo mando a inválido
 
    mov ecx, 3          ; pongo 3 en el contador para validar las letras

Validarletras:
    cmp al , 'A'        ; reviso que la letra sea mayor o igual a 'A'
    jn invalido
    cmp al, 'Z'         ; reviso que sea menor o igual a 'Z'
    ja invalido
    inc esi             ; paso al siguiente caracter
    loop validarletras

    cmp al, '-'         ; verifico que el guión medio esté en su lugar
    jne invalido
    inc esi             ; avanzo al siguiente

Validardigitos:
    cmp al, '0'         ; checo que el dígito sea mayor o igual a '0'
    jn invalido
    cmp al, '9'         ; y menor o igual a '9'
    ja invalido
    inc esi
    loop Validardigitos

esValido:
    mov edx, OFFSET msgValido ; si paso todas las reglas, cargo el mensaje de éxito
    call WriteString

main ENOP
END main