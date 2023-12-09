; ----------------------------------------------------------------------------
; Purpose:   x86 Assembly function to print the statement "The GCD of " to the console.
;            The function is named printAnswerStatement and is globally accessible.
;
; Sections:
;   .data:   Contains the definition of the statement "The GCD of " (null-terminated string).
;   .text:   Defines the printAnswerStatement function, which prints the statement.
;
; Parameters:
;   None
;
; Registers Used:
;   - rax, rbx, rcx, rdx: General-purpose registers used for system call setup.
;
; System Call:
;   - sys_write (Interrupt 0x80) is used to write the statement to the console.
;
; ----------------------------------------------------------------------------
section .data
    answer db "The GCD of ", 0  ; Definition of the statement (null-terminated string)

section .text
    global printAnswerStatement

printAnswerStatement:
    ;; Print the statement "The GCD of "
    push rax
    push rbx
    push rcx
    push rdx

    mov rax, 4          ; System call number for sys_write
    mov rbx, 1          ; File descriptor 1 (stdout)
    mov rcx, answer     ; Pointer to the statement
    mov rdx, 11         ; Number of bytes to write (11 for the statement)
    int 0x80             ; Invoke the system call

    pop rdx
    pop rcx
    pop rbx
    pop rax

    ret
