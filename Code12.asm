; Suppose that CL contains the value of 5. Take an integer from user. Compare the value with CL.
; And show whether the user input is less than, greater than and equal to CL. 

.model small
.stack 100h

.data
    num db ?
    msg db 0Ah, 0Dh, 'Guess the number: $'
    msg1 db 0Ah, 0Dh, 'Correct guess.$'
    msg2 db 0Ah, 0Dh, 'Your guess is larger than the number.$'
    msg3 db 0Ah, 0Dh, 'Your guess is smaller than the number.$'

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    lea dx, msg
    int 21h

    mov cl, 5

    mov ah, 01h
    int 21h
    mov bl, al
    sub bl, 30h        ; Convert ASCII to actual number (0-9)

    cmp cl, bl

    je Correct_Text
    jl Less_than_Text   ; if BL < CL
    jg Grater_than_Text ; if BL > CL

Correct_Text:
    mov ah, 09h
    lea dx, msg1
    int 21h
    jmp Exit

Grater_than_Text:
    mov ah, 09h
    lea dx, msg3
    int 21h
    jmp Exit

Less_than_Text:
    mov ah, 09h
    lea dx, msg2
    int 21h
    jmp Exit

Exit:
    mov ah, 4Ch
    int 21h

    main endp
end main