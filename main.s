; ----------------------------------------------------------------------------
; Purpose:   x86 Assembly program to calculate and print the Greatest Common Divisor (GCD)
;            of two numbers entered by the user.
;
; Sections:
;   .text:   Defines the program entry point (_start) and includes calls to various
;            functions for input conversion, GCD calculation, and output printing.
;
; External Functions:
;   - convertFirstNumber: Converts and retrieves the first user input.
;   - convertSecondNumber: Converts and retrieves the second user input.
;   - findGCD: Finds the Greatest Common Divisor of two numbers (rax and rbx).
;   - printAX: Prints the value stored in the rax register.
;   - printAnswerStatement: Prints the statement "The GCD of ".
;   - printAnd: Prints the string "and ".
;   - printIs: Prints the string "is ".
;   - printSpace: Prints a space character.
;   - printNL: Prints a new line character.
;   - printPeriod: Prints a period character.
;
; ----------------------------------------------------------------------------
section .text
    global _start
    extern convertFirstNumber
    extern convertSecondNumber
    extern findGCD
    extern printAX
    extern printAnswerStatement
    extern printAnd
    extern printIs
    extern printSpace
    extern printNL
    extern printPeriod

_start:
    ; Convert and retrieve the first number entered by the user
    call convertFirstNumber

    ; Convert and retrieve the second number entered by the user
    call convertSecondNumber

    ; Print the first part of the answer statement
    call printAnswerStatement

    ; Print the first value (stored in rax)
    call printAX

    ; Print a space and the string "and"
    call printSpace
    call printAnd

    ; Print the second value (stored in rbx)
    ; Preserve rax to print out the answer from findGCD later
    push rax
    mov rax, rbx
    call printAX
    pop rax

    ; Print a space and the string "is"
    call printSpace
    call printIs

    ; Find the GCD between the two values (rax and rbx)
    call findGCD

    ; Print the calculated GCD
    call printAX

    ; Print a period, a new line, and exit the program
    call printPeriod
    call printNL

    ; Exit the program and return control to the Linux kernel
    mov eax, 1
    mov ebx, 0
    int 0x80
