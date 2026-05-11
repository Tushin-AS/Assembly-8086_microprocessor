; JUMP Example

.model small
.stack 100h

.data

.code
main proc 
    mov ah, 02h
    mov cx, 256
    mov dl, 0

print_loop:
    int 21h
    inc dl
    dec cx
    jnz print_loop

    mov ah, 4Ch
    int 21h

    main endp
end main