; Subtract 2 numbers

.model small
.stack 100h

.data
    num1 db 9
    num2 db 1
    result db ?
    msg db 'Result = $'

.code
main proc
    mov ax, @data
    mov ds, ax

    mov al, num1
    sub al, num2
    mov result, al

    mov ah, 09h
    mov dx, offset msg
    int 21h

    mov al, result
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    mov ah, 4Ch
    int 21h

    main endp
end main