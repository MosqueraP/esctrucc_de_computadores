
# El siguiente programa consiste en solicitar al usuario 3 valores por consola y devolverle en un mensaje amigable 
# indicandole cual es el moayor

# DEFINICION DE VARIABLES
    .data
msg1:   .asciiz "Por favor ingresa el primer número: "
msg2:   .asciiz "Por favor ingresa el segundo número: "
msg3:   .asciiz "Por favor ingresa el tercer número: "
msg4:   .asciiz "El número mayor es: "
num1:   .word 0
num2:   .word 0
num3:   .word 0

    .text
    .globl main

# Funcion principal de nuestro programa
main:
    li $v0, 4  # Preguntamos por el primer número
    la $a0, msg1
    syscall 
    li $v0, 5 # Leeemos el primer número
    syscall
    sw $v0, num1

   
    li $v0, 4  # Preguntamos por el segundo numero
    la $a0, msg2
    syscall
    li $v0, 5 # Leeemos el segundo número
    syscall
    sw $v0, num2
    
    li $v0, 4  # Preguntamos por el  3r número
    la $a0, msg3
    syscall
    li $v0, 5  # Leeemos el 3 número
    syscall
    sw $v0, num3

    # Comparamos los números y mostrar el mayor
    lw $t0, num1
    lw $t1, num2
    lw $t2, num3
    bgt $t0, $t1, num1_mayor
    move $t0, $t1
    bgt $t0, $t2, num1_mayor
    move $t0, $t2

num1_mayor:
    # Mostrando el mayor de los numeros
    li $v0, 4
    la $a0, msg4
    syscall
    li $v0, 1
    move $a0, $t0
    syscall

    # Fin del programa
    li $v0, 10
    syscall
