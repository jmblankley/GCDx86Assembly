; ----------------------------------------------------------------------------
; Purpose:   x86 Assembly function to convert and return the second number entered by the user.
;            The function is named convertSecondNumber and is globally accessible.
;
; Sections:
;   .data:   Contains the prompt string "Enter second number: " and a buffer to store the input.
;   .text:   Defines the convertSecondNumber function, which prompts the user and converts the input.
;
; Parameters:
;   None
;
; Registers Used:
;   - rax, rcx, rdx: General-purpose registers used for system call setup and computation.
;
; System Calls:
;   - sys_write (Interrupt 0x80) is used to print the prompt string.
;   - sys_read (Interrupt 0x80) is used to read the user's input into a buffer.
;
; Returns:
;   - The converted integer is stored in the ebx register.
;
; ----------------------------------------------------------------------------
section .data
    secondPrompt db "Enter second number: ", 0    ; Prompt string
    secondNumBuffer resb 100                      ; Buffer to store user input

section .text
    global convertSecondNumber

convertSecondNumber:
    ;; Prompt the user to enter the second number
    push rax
    push rcx
    push rdx

    mov edx, 21         ; Length of string
    mov ecx, secondPrompt
    mov eax, 4          ; eax=4 -> print string
    mov ebx, 1          ; Param for printing string
    int 0x80            ; Invoke system call to print prompt

    ;; Read the user's input into the buffer
    mov eax, 3          ; eax=3 -> read from stdin
    mov ebx, 0          ; File descriptor 0 (stdin)
    mov ecx, secondNumBuffer
    mov edx, 100        ; Buffer size
    int 0x80            ; Invoke system call to read input

    ;; Initialize variables for conversion
    mov rcx, 0
    mov rdx, 0
    mov rax, 0

doSecondConversion:
    ;; Put the character at rcx 'index' in dl
    mov dl, [secondNumBuffer + rcx]

    ;; Check if char is a newline, end loop if it is
    cmp dl, 0xA
    je endSecondConversion

    ;; Change the char to a number (integer)
    sub dl, 0x30

    ;; Put 10 into bx
    mov bx, 10

    ;; Multiply eax by 10 and add the integer version of the char
    imul eax, ebx
    add eax, edx

    ;; Increment rcx
    inc rcx

    jne doSecondConversion

endSecondConversion:
    ;; Move conversion result from eax to ebx
    mov ebx, eax

    pop rdx
    pop rcx
    pop rax

    ret
