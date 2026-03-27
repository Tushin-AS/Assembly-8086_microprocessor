; Write an assembly program that a) takes three lowercase letters from the user, 
; b) print them in uppercase letters.

.model small
.stack 100h

.data
    msg1 db 0Ah, 0Dh, 'Enter three lowercase letters: $'
    msg2 db 0Ah, 0Dh, 'The three UPPERCASE letters: $'

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    lea dx, msg1
    int 21h

    mov ah, 01h
    int 21h
    mov bh, al

    mov ah, 01h
    int 21h
    mov bl, al

    mov ah, 01h
    int 21h
    mov ch, al

    sub bh, 20h
    sub bl, 20h
    sub ch, 20h

    mov ah, 02h
    mov dl, 0Dh
    int 21h
    mov dl, 0Ah
    int 21h

    mov ah, 09h
    lea dx, msg2
    int 21h

    mov ah, 02h
    mov dl, bh
    int 21h
    mov dl, bl
    int 21h
    mov dl, ch
    int 21h

    mov ah, 4Ch
    int 21h

    main endp
end main