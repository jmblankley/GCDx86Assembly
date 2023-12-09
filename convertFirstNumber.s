; ----------------------------------------------------------------------------
; Purpose:   x86 Assembly function to convert and return the first number entered by the user.
;            The function is named convertFirstNumber and is globally accessible.
;
; Sections:
;   .data:   Contains the prompt string "Enter first number: " and a buffer to store the input.
;   .text:   Defines the convertFirstNumber function, which prompts the user and converts the input.
;
; Parameters:
;   None
;
; Registers Used:
;   - rax, rbx, rcx, rdx: General-purpose registers used for system call setup and computation.
;
; System Calls:
;   - sys_write (Interrupt 0x80) is used to print the prompt string.
;   - sys_read (Interrupt 0x80) is used to read the user's input into a buffer.
;
; Returns:
;   - The converted integer is stored in the eax register.
;
; ----------------------------------------------------------------------------
section .data
    firstPrompt db "Enter first number: ", 0      ; Prompt string
    firstNumBuffer resb 100                      ; Buffer to store user input

section .text
    global convertFirstNumber

convertFirstNumber:
    ;; Prompt the user to enter the first number
    push rbx
    push rcx
    push rdx

    mov edx, 20         ; Length of string
    mov ecx, firstPrompt
    mov eax, 4          ; eax=4 -> print string
    mov ebx, 1          ; Param for printing string
    int 0x80            ; Invoke system call to print prompt

    ;; Read the user's input into the buffer
    mov eax, 3          ; eax=3 -> read from stdin
    mov ebx, 0          ; File descriptor 0 (stdin)
    mov ecx, firstNumBuffer
    mov edx, 100        ; Buffer size
    int 0x80            ; Invoke system call to read input

    ;; Initialize variables for conversion
    mov rcx, 0
    mov rdx, 0
    mov rax, 0

doFirstConversion:
    ;; Put the character at rcx 'index' in dl
    mov dl, [firstNumBuffer + rcx]

    ;; Check if char is a newline, end loop if it is
    cmp dl, 0xA
    je endFirstConversion

    ;; Change the char to a number (integer)
    sub dl, 0x30

    ;; Put 10 into bx
    mov bx, 10

    ;; Multiply eax by 10 and add the integer version of the char
    imul eax, ebx
    add eax, edx

    ;; Increment rcx
    inc rcx

    jne doFirstConversion

endFirstConversion:
    ; Conversion result is in eax

    pop rdx
    pop rbx
    pop rcx

    ret
