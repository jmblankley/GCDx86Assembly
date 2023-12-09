; ----------------------------------------------------------------------------
; Purpose:   x86 Assembly function to print a space character to the console.
;            The function is named printSpace and is globally accessible.
;
; Sections:
;   .data:   Contains the definition of the space character (ASCII 32).
;   .text:   Defines the printSpace function, which prints a space character.
;
; Parameters:
;   None
;
; Registers Used:
;   - rax, rbx, rcx, rdx: General-purpose registers used for system call setup.
;
; System Call:
;   - sys_write (Interrupt 0x80) is used to write the space character to the console.
;
; ----------------------------------------------------------------------------
section .data
    space db " ", 0  ; Definition of the space character (null-terminated string)

section .text
    global printSpace

printSpace:
    ;; Print a space character
    push rax
    push rbx
    push rcx
    push rdx

    mov rax, 4         ; System call number for sys_write
    mov rbx, 1         ; File descriptor 1 (stdout)
    mov rcx, space     ; Pointer to the space character
    mov rdx, 1         ; Number of bytes to write (1 for the space character)
    int 0x80            ; Invoke the system call

    pop rdx
    pop rcx
    pop rbx
    pop rax

    ret
