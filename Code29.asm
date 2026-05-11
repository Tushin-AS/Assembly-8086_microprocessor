.model small
.stack 100h

.data
    value dw -5

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ax, value

    cmp ax, 0
    jge End_if

    mov bx, -1

End_if:
    mov ah, 4Ch
    int 21h

    main endp
end main