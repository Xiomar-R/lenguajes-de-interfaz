; Materia: Lenguajes de Interfaz unidad 2
; Alumno: Eber Angulo Ramirez
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 2. Captura y desplegado de mensajes
; Descripción: Programa para capturar una cadena desde el teclado y desplegarla en consola.

INCLUDE Irvine32.inc

.data
    prompt BYTE "Ingrese un mensaje: ", 0  ; Mensaje de solicitud para el usuario
    buffer BYTE 50 DUP(0)                  ; Búfer de 50 bytes para almacenar la cadena ingresada

.code
main PROC
    mov edx, OFFSET prompt              ; Carga la direccion del mensaje de solicitud en EDX
    call WriteString                    ; Muestra el mensaje en la consola

    mov edx, OFFSET buffer              ; Carga la direccion del búfer de almacenamiento
    mov ecx, SIZEOF buffer              ; Establece el tamaño máximo de caracteres a leer
    call ReadString                     ; Lee la cadena introducida por el usuario desde el 

teclado

    call Crlf                           
    
    mov edx, OFFSET buffer              ; Apunta de nuevo al bufer con el texto capturado
    call WriteString                    ; Imprime el texto ingresado en la consola
    call Crlf                           

    exit       
                         
main ENDP
END main
