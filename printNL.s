; ----------------------------------------------------------------------------
; Purpose:   x86 Assembly function to print a new line character "\n" to the console.
;            The function is named printNL and is globally accessible.
;
; Sections:
;   .data:   Contains the definition of the new line character (ASCII 10).
;   .text:   Defines the printNL function, which prints a new line character.
;
; Parameters:
;   None
;
; Registers Used:
;   - rax, rbx, rcx, rdx: General-purpose registers used for system call setup.
;
; System Call:
;   - sys_write (Interrupt 0x80) is used to write the new line character to the console.
;
; ----------------------------------------------------------------------------
section .data
    nlstring db 0xa  ; Definition of the new line character (null-terminated string)

section .text
    global printNL

printNL:
    ;; Print a new line character
    push rax
    push rbx
    push rcx
    push rdx

    mov rax, 4         ; System call number for sys_write
    mov rbx, 1         ; File descriptor 1 (stdout)
    mov rcx, nlstring  ; Pointer to the new line character
    mov rdx, 1         ; Number of bytes to write (1 for the new line character)
    int 0x80            ; Invoke the system call

    pop rdx
    pop rcx
    pop rbx
    pop rax

    ret
