; Read a character and display it 50 times on the next line.

.model small
.stack 100h

.data
    char db ?
    msg1 db 0Ah, 0Dh, 'Enter a character: $'
    count db 1

.code
main proc 
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    lea dx, msg1
    int 21h

    mov ah, 01h
    int 21h
    mov char, al

    mov ah, 02h
    mov dl, 0Dh
    int 21h
    mov dl, 0Ah
    int 21h

    mov cl, 50

Main_Code:
    cmp count, cl
    jle Print_Text
    jg Exit

Print_Text:
    mov ah, 02h
    mov dl, char
    int 21h
    inc count
    jmp Main_Code

Exit:
    mov ah, 4Ch
    int 21h

    main endp
end main