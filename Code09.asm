; Write an assembly program that non-stop prints Hello World. 

.model small
.stack 100h

.data
    msg db 0Ah, 0Dh, 'Hello, World! $'

.code
main proc
    mov ax, @data
    mov ds, ax
    
print_msg:
    mov ah, 09h
    lea dx, msg
    int 21h

    jmp print_msg

    main endp
end main