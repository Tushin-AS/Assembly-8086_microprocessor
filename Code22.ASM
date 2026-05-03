; Output Tracing

.MODEL SMALL
.STACK 100H

.DATA
    msg1 DB 'Output:', 0DH, 0AH, '$'
    newline DB 0DH, 0AH, '$'
    num DB 2

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 9
    LEA DX, msg1
    INT 21H

    MOV CX, 5

print_loop:
    MOV AL, num
    SHL AL, 1
    CMP AL, 10
    JE Print_DD1
    CMP AL, 12
    JE Print_DD2
    ADD AL, '0'
    MOV DL, AL
    MOV AH, 2
    INT 21H

    JMP skip_print

Print_DD1:
    MOV DL, '1'
    MOV AH, 2
    INT 21H
    MOV DL, '0'
    MOV AH, 2
    INT 21H

    JMP skip_print

Print_DD2:
    MOV DL, '1'
    MOV AH, 2
    INT 21H
    MOV DL, '2'
    MOV AH, 2
    INT 21H

    JMP skip_print

skip_print:
    MOV AH, 9
    LEA DX, newline
    INT 21H

    ADD num, 1
    LOOP print_loop
    
    MOV AH, 4CH
    INT 21H

    MAIN ENDP
END MAIN