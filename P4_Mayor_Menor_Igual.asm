; Materia: Lenguajes de Interfaz
; Alumno: Eber Angulo Ramirez
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 4.1 Mayor, menor o igual con entrada del usuario
; Descripción: Solicita dos números por teclado y evalúa relación de mayor, menor o igual.

INCLUDE Irvine32.inc

.data
    prompt1 BYTE "Ingrese el segundo numero: ", 0
    prompt2 BYTE "Ingrese el primer numero: ", 0
    msgDiferentes BYTE "Los numeros son diferentes", 0
    msgiguales BYTE "Los numeros son iguales", 0
    msgEsmayoroigual BYTE "El primer numero es mayor o igual", 0
    msgMenor BYTE "El numero es menor", 0

.code
main PROC

	; aquí pido y leo el primer número
	mov edx, OFFSET prompt2
	call WriteString 
	call ReadInt
	mov ecx, eax

	; aquí pido y leo el segundo número
	mov edx, OFFSET prompt1
	call WriteString 
	call ReadInt
	mov ebx, eax

	mov eax, ecx
	mov ebx, ebx
	
	; comparo los dos valores que ingresó el usuario
	cmp eax, ebx

	je iguales ; si son iguales salta a esta etiqueta

	mov edx, OFFSET msgDiferentes
	call WriteString

	jge mayor
	mov edx, OFFSET msgMenor
	call WriteString

	jmp fin
	
iguales:
	mov edx, OFFSET msgiguales
	call WriteString
	jmp fin

mayor:
	mov edx, OFFSET msgEsmayoroigual
	call WriteString

fin:
	call Crif
	exit

main ENDP
END main