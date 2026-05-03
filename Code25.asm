.model small
.stack 100h

.data
    msg_input   db 'Enter an 8-bit binary number: $'
    msg_shifted db 13, 10, 'Shifted binary (SHL 2):       $'
    msg_ones    db 13, 10, "Number of 1's: $"
    msg_zeros   db 13, 10, "Number of 0's: $"
    
    count1      db 0    ; Variable to keep track of 1s
    count0      db 0    ; Variable to keep track of 0s

.code
main proc
    ; 1. Initialize Data Segment
    mov ax, @data
    mov ds, ax

    ; 2. Print the input prompt
    mov ah, 09h
    lea dx, msg_input
    int 21h

    ; 3. Read the 8-bit binary number into BL
    mov cx, 8           ; Set loop counter for 8 bits
    mov bl, 0           ; Clear BL to accumulate the binary value
read_loop:
    mov ah, 01h         ; DOS interrupt to read a single character
    int 21h
    sub al, '0'         ; Convert ASCII ('0' or '1') to numeric (0 or 1)
    shl bl, 1           ; Shift current accumulated value left by 1
    or bl, al           ; Insert the newly read bit at the LSB
    loop read_loop

    ; 4. Perform the SHL by 2 operation
    shl bl, 2

    ; 5. Print the "Shifted binary" message
    mov ah, 09h
    lea dx, msg_shifted
    int 21h

    ; 6. Display the shifted binary result AND count the bits
    mov cx, 8           ; Set loop counter for 8 bits again
    mov bh, bl          ; Copy BL (shifted value) to BH so we can alter BH safely
display_and_count:
    shl bh, 1           ; Shift MSB of BH into the Carry Flag (CF)
    jc is_one           ; If Carry Flag is 1, jump to 'is_one'

is_zero:
    inc count0          ; Increment the 0's counter
    mov ah, 02h         ; DOS interrupt to print character
    mov dl, '0'         ; Load ASCII '0' to print
    int 21h
    jmp next_bit        ; Skip the 'is_one' block

is_one:
    inc count1          ; Increment the 1's counter
    mov ah, 02h         ; DOS interrupt to print character
    mov dl, '1'         ; Load ASCII '1' to print
    int 21h

next_bit:
    loop display_and_count

    ; 7. Output the number of 1's
    mov ah, 09h
    lea dx, msg_ones
    int 21h

    mov ah, 02h
    mov dl, count1      ; Load the integer count
    add dl, '0'         ; Convert integer (0-8) to ASCII character
    int 21h

    ; 8. Output the number of 0's
    mov ah, 09h
    lea dx, msg_zeros
    int 21h

    mov ah, 02h
    mov dl, count0      ; Load the integer count
    add dl, '0'         ; Convert integer (0-8) to ASCII character
    int 21h

    ; 9. Terminate the program cleanly
    mov ah, 4Ch
    int 21h

    main endp
end main