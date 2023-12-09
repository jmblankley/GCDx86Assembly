; ----------------------------------------------------------------------------
; Purpose:   x86 Assembly function to print a period character "." to the console.
;            The function is named printPeriod and is globally accessible.
;
; Sections:
;   .data:   Contains the definition of the period character (ASCII 46).
;   .text:   Defines the printPeriod function, which prints a period character.
;
; Parameters:
;   None
;
; Registers Used:
;   - rax, rbx, rcx, rdx: General-purpose registers used for system call setup.
;
; System Call:
;   - sys_write (Interrupt 0x80) is used to write the period character to the console.
;
; ----------------------------------------------------------------------------
section .data
    period db "."  ; Definition of the period character (null-terminated string)

section .text
    global printPeriod

printPeriod:
    ;; Print a period character
    push rax
    push rbx
    push rcx
    push rdx

    mov rax, 4         ; System call number for sys_write
    mov rbx, 1         ; File descriptor 1 (stdout)
    mov rcx, period    ; Pointer to the period character
    mov rdx, 1         ; Number of bytes to write (1 for the period character)
    int 0x80            ; Invoke the system call

    pop rdx
    pop rcx
    pop rbx
    pop rax

    ret
