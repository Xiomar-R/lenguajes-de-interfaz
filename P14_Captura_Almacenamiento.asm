; Materia: Lenguajes de Interfaz
; Alumno: Eber Angulo Ramirez
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 14. Captura y almacenamiento de datos numéricos
; Descripción: Lectura de cantidad desde teclado, validación de caracteres y cálculo de existencias.

INCLUDE Irvine32.inc

.data
    promptMsg         BYTE "Ingrese la cantidad recibida (1-99): ", 0
    errorMsg          BYTE "Error de entrada. Intente nuevamente.", 0
    msgExistencia     BYTE "Existencia actual: ", 0
    
    buffer            BYTE 10 DUP(0)
    cantidadRecibida  DWORD ?
    existenciaInicial DWORD 25
    existenciaActual  DWORD ?
    outBuffer         BYTE 10 DUP(0)

.code
main PROC
PedirDatos:
    mov edx, OFFSET promptMsg ; preparo el mensaje para pedir la cantidad
    call WriteString
    
    mov edx, OFFSET buffer    ; preparo el buffer para recibir la entrada
    mov ecx, SIZEOF buffer
    call ReadString           ; leo lo que teclea el usuario
    
    cmp eax, 0                ; checo si no ingresó nada
    je ErrorEntrada
    cmp eax, 2                ; reviso que no sean más de 2 caracteres
    ja ErrorEntrada

    mov esi, OFFSET buffer
    mov ecx, eax              ; uso la cantidad de caracteres leídos como contador
ValidarCaracteres:
    mov al, [esi]
    cmp al, '0'               ; verifico que sea un número válido 
    jb ErrorEntrada
    cmp al, '9'               ; y menor o igual a '9'
    ja ErrorEntrada
    inc esi
    loop ValidarCaracteres

    mov esi, OFFSET buffer
    mov eax, 0
    mov ebx, 10
    mov ecx, 2                ; máximo 2 dígitos para convertir
ConvertLoop:
    movzx edx, BYTE PTR esi
    cmp dl, 0
    je FinConversion
    cmp dl, 0Dh               ; ignoro si hay algún retorno de carro
    je FinConversion
    cmp dl, 0Ah               ; ignoro el salto de línea
    je FinConversion
    sub dl, '0'               ; convierto el carácter ASCII a número real
    mul ebx                   ; multiplico por 10 las decenas
    add eax, edx              ; sumo el dígito
    inc esi
    loop ConvertLoop

FinConversion:
    cmp eax, 1                ; valido que el número sea al menos 1
    jb ErrorEntrada
    cmp eax, 99               ; y que no pase de 99
    ja ErrorEntrada

    mov cantidadRecibida, eax ; guardo la cantidad que se recibió
    mov ebx, existenciaInicial
    add eax, ebx              ; le sumo la cantidad recibida al inventario inicial
    mov existenciaActual, eax ; guardo el total actualizado

    mov edx, OFFSET msgExistencia ; preparo el mensaje de existencia actual
    call WriteString

    mov eax, existenciaActual
    mov edi, OFFSET outBuffer
    call ConvDwordToString    ; llamo a la subrutina para convertir el número a texto

    mov edx, OFFSET outBuffer ; imprimo el resultado en pantalla
    call WriteString
    call Crlf
    jmp FinProg               ; salto al fin del programa si todo salió bien

ErrorEntrada:
    call Crlf
    mov edx, OFFSET errorMsg  ; si hubo error, muestro el mensaje correspondiente
    call WriteString
    call Crlf
    jmp PedirDatos            ; vuelvo a pedir los datos desde el inicio

FinProg:
    exit                      ; termino el programa
main ENDP

ConvDwordToString PROC
    pushad                    ; guardo los registros en la pila
    mov ecx, 0
    mov ebx, 10
DivLoop:
    mov edx, 0
    div ebx                   ; divido entre 10 para sacar dígito por dígito
    add dl, '0'               ; lo paso a formato ASCII
    push edx                  ; guardo el dígito en la pila
    inc ecx
    cmp eax, 0
    jne DivLoop
PopLoop:
    pop edx                   ; voy sacando los dígitos en orden correcto
    mov edi, dl
    inc edi
    loop PopLoop
    mov BYTE PTR edi, 0       ; pongo el fin de cadena
    popad                     ; restauro los registros
    ret                       ; regreso al programa principal
ConvDwordToString ENDP

END main