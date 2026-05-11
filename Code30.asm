.model small
.stack 100h

.data
    value 10

.code
main proc
    mov ax, @data
    mov ds, ax

    mov al, value

    cmp al, 0
    jge else_case
    jl if_case

if_case:
    mov ah, FFh
    jmp exit

else_case:
    mov ah, 00h
    jmp exit

exit:
    mov ah, 4Ch
    int 21h

    main endp
end main