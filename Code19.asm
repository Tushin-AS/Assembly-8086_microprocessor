; Read a character & display it 50 times on next line.
; Hint >> Use LOOP & put CX = 50.

.model small
.stack 100h

.data
    msg db 'Enter a character: $'
    char db ?

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    lea dx, msg
    int 21h

    mov ah, 01h
    int 21h
    mov char, al

    mov ah, 02h
    mov dl, 0Dh
    int 21h
    mov dl, 0Ah
    int 21h

    mov cx, 50

Print_Loop:
    mov ah, 02h
    int 21h
    mov dl, char

    loop Print_Loop

    mov ah, 4Ch
    int 21h

    main endp
end main