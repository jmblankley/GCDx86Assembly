; ----------------------------------------------------------------------------
; Purpose:   x86 Assembly function to print a single digit to the console.
;            The function is named printDigit and is globally accessible.
;
; Sections:
;   .data:   Contains a buffer to hold the digit as a character (null-terminated string).
;   .text:   Defines the printDigit function, which converts and prints a single digit.
;
; Parameters:
;   - al: The register containing the digit to be printed (assumed to be in the range 0-9).
;
; Registers Used:
;   - rax, rbx, rcx, rdx: General-purpose registers used for system call setup.
;
; System Call:
;   - sys_write (Interrupt 0x80) is used to write the digit character to the console.
;
; ----------------------------------------------------------------------------
section .data
    buffer db 0xa  ; Buffer to hold the digit as a character (null-terminated string)

section .text
    global printDigit

printDigit:
    ;; Convert the digit to a character and print it
    push rax
    push rbx
    push rcx
    push rdx

    add al, 0x30       ; Convert al to character
    mov [buffer], al   ; Store the digit to print into the buffer

    mov rax, 4         ; System call number for sys_write
    mov rbx, 1         ; File descriptor 1 (stdout)
    mov rcx, buffer    ; Pointer to the digit character in the buffer
    mov rdx, 1         ; Number of bytes to write (1 for the digit character)
    int 0x80            ; Invoke the system call

    pop rdx
    pop rcx
    pop rbx
    pop rax

    ret
