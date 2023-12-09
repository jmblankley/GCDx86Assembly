; ----------------------------------------------------------------------------
; Purpose:   x86 Assembly function to print the string "and " to the console.
;            The function is named printAnd and is globally accessible.
;
; Sections:
;   .data:   Contains the definition of the string "and " (null-terminated string).
;   .text:   Defines the printAnd function, which prints the "and " string.
;
; Parameters:
;   None
;
; Registers Used:
;   - rax, rbx, rcx, rdx: General-purpose registers used for system call setup.
;
; System Call:
;   - sys_write (Interrupt 0x80) is used to write the "and " string to the console.
;
; ----------------------------------------------------------------------------
section .data
    andString db "and ", 0  ; Definition of the "and " string (null-terminated string)

section .text
    global printAnd

printAnd:
    ;; Print the "and " string
    push rax
    push rbx
    push rcx
    push rdx

    mov rax, 4          ; System call number for sys_write
    mov rbx, 1          ; File descriptor 1 (stdout)
    mov rcx, andString  ; Pointer to the "and " string
    mov rdx, 4          ; Number of bytes to write (4 for the "and " string)
    int 0x80             ; Invoke the system call

    pop rdx
    pop rcx
    pop rbx
    pop rax

    ret
