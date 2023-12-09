; ----------------------------------------------------------------------------
; Purpose:   x86 Assembly function to print the string "is " to the console.
;            The function is named printIs and is globally accessible.
;
; Sections:
;   .data:   Contains the definition of the string "is " (null-terminated string).
;   .text:   Defines the printIs function, which prints the "is " string.
;
; Parameters:
;   None
;
; Registers Used:
;   - rax, rbx, rcx, rdx: General-purpose registers used for system call setup.
;
; System Call:
;   - sys_write (Interrupt 0x80) is used to write the "is " string to the console.
;
; ----------------------------------------------------------------------------
section .data
    isString db "is ", 0  ; Definition of the "is " string (null-terminated string)

section .text
    global printIs

printIs:
    ;; Print the "is " string
    push rax
    push rbx
    push rcx
    push rdx

    mov rax, 4          ; System call number for sys_write
    mov rbx, 1          ; File descriptor 1 (stdout)
    mov rcx, isString   ; Pointer to the "is " string
    mov rdx, 4          ; Number of bytes to write (4 for the "is " string)
    int 0x80             ; Invoke the system call

    pop rdx
    pop rcx
    pop rbx
    pop rax

    ret
