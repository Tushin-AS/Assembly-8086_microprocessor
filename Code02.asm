; Add 2 numbers

.model small
.stack 100h

.data
    num1 db 5
    num2 db 2
    result db ? ; null / empty
    msg db 'Result = $' ; $ must at the end of the string

.code
main proc
    mov ax, @data   ; Initialize data segment
    mov ds, ax

    mov al, num1
    add al, num2    ; Addition
    mov result, al

    ; Command to print the output
    mov ah, 09h ; DOS Function Number 09h => Display String
    mov dx, offset msg
    int 21h ; DOS Interrupt for I/O.

    ; print result
    mov al, result
    add al, 30h ; DOS Function Number 30h => To convert in ASCII
    mov dl, al
    mov ah, 02h ; DOS Function Number 02h => Print Character, expect the char in DL
    int 21h

    ; Exit program
    mov ah, 4Ch ; DOS Function Number 4Ch => Terminate a program
    int 21h

    main endp
end main

