; ----------------------------------------------------------------------------
; Purpose:   x86 Assembly function to print the contents of the AX register as a decimal number.
;            The function is named printAX and is globally accessible.
;
; Sections:
;   .text:   Defines the printAX function, which converts and prints the contents of AX.
;            It relies on the external function printDigit to print individual digits.
;
; Parameters:
;   None (Assumes the value to print is in the AX register).
;
; Registers Used:
;   - rax, rbx, rcx, rdx: General-purpose registers used for computation and system call setup.
;
; External Function:
;   - printDigit: Assumed to be defined elsewhere; responsible for printing a single digit.
;
; ----------------------------------------------------------------------------
section .text
    global printAX
    extern printDigit

printAX:
    ;; Print the contents of the AX register as a decimal number
    push rax
    push rbx
    push rcx
    push rdx

    mov rcx, 0  ; Initialize a counter for the number of digits

    ; Loop to extract individual digits
doDigit:
    mov bx, 0xa      ; Divisor for division
    mov dx, 0        ; Clear the remainder
    div bx           ; Quotient (next digit) in ax, remainder in dx

    push rdx         ; Push the next digit onto the stack
    inc rcx          ; Increment the digit counter

    cmp ax, 0        ; Check if quotient is zero
    jne doDigit      ; If not, continue extracting digits

    ; Loop to print each digit
nextDigit:
    pop rax          ; Pop the next digit from the stack
    call printDigit  ; Call the external function to print the digit
    dec rcx          ; Decrement the digit counter
    jne nextDigit    ; If more digits, continue printing

    pop rdx
    pop rcx
    pop rbx
    pop rax

    ret
