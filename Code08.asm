; Unconditional Jump    jmp/JMP

.model small
.stack 100h

.data
    msg1 db 'Text Message 1 $'
    msg2 db 'Text Message 2 $'

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    lea dx, msg1
    int 21h

    jmp skip_msg

    mov ah, 09h
    lea dx, msg2
    int 21h

skip_msg:
    mov ah, 4Ch
    int 21h

    main endp
end main