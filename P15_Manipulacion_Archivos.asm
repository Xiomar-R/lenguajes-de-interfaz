; Materia: Lenguajes de Interfaz
; Alumno: Eber Angulo Ramirez
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 15. Manipulación de archivos
; Descripción: Creación, escritura y cierre de un archivo de texto utilizando Irvine32.

INCLUDE Irvine32.inc

.data
	nombreArchivo BYTE "Inventario.txt", 0
	texto BYTE "125", 0
	archivoHandle DWORD ?

	mensajeExito BYTE "Archibo guardado", 0
	mensajeError BYTE "No se guardo el archivo correctamente", 0

.code
	
main PROC
	mov edx, OFFSET nombreArchivo ; cargo el nombre del archivo que voy a crear
	call CreateOutputFile         ; llamo a la función para crear el archivo

	cmp eax, INVALID_HANDLE_VALUE ; checo si ocurrió un error al crearlo
	je error                      ; si es inválido, me voy a la etiqueta error

	mov archivoHandle, eax        ; guardo el identificador (handle) del archivo

	; 2. ESCRIBIR EL TEXTO ("125")
	mov eax, archivoHandle        ; paso el handle del archivo
	mov edx, OFFSET texto         ; cargo el texto que quiero escribir 
	mov ecx, SIZEOF texto - 1     ; calculo el tamaño del texto sin contar el terminador nulo
	call WriteFile                ; escribo los datos en el archivo

	jc errorEscritura             ; si hay error salto a error de escritura

	cmp eax, SIZEOF texto - 1     ; verifico que se hayan escrito todos los bytes correctamente
	jne errorEscritura

	; 3. Cerrar archivo txt
	mov eax, archivoHandle        ; recupero el handle
	call CloseFile                ; cierro el archivo
	
	test eax, eax                 ; compruebo que se haya cerrado sin problemas
	jz error 

	mov edx, OFFSET mensajeExito  ; si todo salió bien, preparo el mensaje de éxito
	call WriteString              
	jmp fin                       ; salto al final del programa

errorEscritura:
	mov eax, archivoHandle
	call CloseFile                ; cierro el archivo si falló la escritura
error:
	mov edx, OFFSET mensajeError  ; cargo el mensaje de error
	call WriteString              

fin:
	exit                      

main ENDP
END main
