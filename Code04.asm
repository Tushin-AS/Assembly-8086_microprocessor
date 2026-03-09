; XCHG

.model small
.stack 100h

.data
    msg1 db 'Before exchange: AL = 1, BL = 5', 0Dh, 0Ah, '$'
    msg2 db 0Dh, 0Ah, 'After exchange: Values swapped', '$'

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    mov dx, offset msg1
    int 21h

    mov al, 1
    mov bl, 5

    xchg al, bl

    mov ah, 09h
    mov dx, offset msg2
    int 21h

    mov ah, 4Ch
    int 21h
    
    main endp
 end main