; ----------------------------------------------------------------------------
; Purpose:   x86 Assembly function to find the Greatest Common Divisor (GCD) of two numbers.
;            The function is named findGCD and is globally accessible.
;
; Sections:
;   .data:   Contains a buffer and a newline character for potential future use.
;   .text:   Defines the findGCD function, which uses the Euclidean algorithm to find the GCD.
;
; Parameters:
;   - rax: The first number (assumed to be non-negative).
;   - rbx: The second number (assumed to be non-negative).
;
; Registers Used:
;   - rax, rbx, rcx, rdx: General-purpose registers used for computation and condition checks.
;
; Returns:
;   - The GCD of the two input numbers is stored in the rax register.
;
; ----------------------------------------------------------------------------
section .data
    buffer db 0       ; Placeholder buffer, not currently used
    nlstring db 0xA   ; Newline character, not currently used

section .text
    global findGCD

findGCD:
    ;; Base case: if (b == 0), answer = a
    cmp rbx, 0
    je endLoop

    ;; Second case: else if (a < b), answer = GCD(b, a)
    cmp rax, rbx
    jl switchDigits

    ;; Third case: else (b < a), answer = GCD(b, a % b)
    call modDigits

switchDigits:
    ;; Swap the values of a and b
    mov rcx, rax
    mov rax, rbx
    mov rbx, rcx

    ;; Recursive call with swapped values
    call findGCD

modDigits:
    ;; Base case: if (b == 0), answer = a
    cmp rbx, 0
    je endLoop

    ;; Calculate remainder using division (remainder in rdx)
    mov rdx, 0
    div rbx
    mov rax, rdx

    ;; Check if remainder is zero
    cmp rax, 0
    je endLoop

    ;; Recursive call with new values
    call findGCD

endLoop:
    ;; The GCD is stored in rax

    ret
