.model small
.stack 100h

.data
    msg1 db 'Capital Letters:', 0Dh, 0Ah, '$'
    new_line db 0Dh, 0Ah, '$'

.code
main proc 
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    lea dx, msg1
    int 21h

    mov bl, 'A'

Print_Loop:
    cmp bl, 'Z'
    ja Exit

    mov ah, 02h
    mov dl, bl
    int 21h

    inc bl        ; Next letter
    jmp Print_Loop

Exit:
    mov ah, 09h
    lea dx, new_line
    int 21h
    
    mov ah, 4Ch
    int 21h

    main endp
end main