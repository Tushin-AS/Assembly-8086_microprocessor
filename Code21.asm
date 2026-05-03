; Output Tracing

.MODEL SMALL
.STACK 100H

.DATA
    M1 DB 'Output: ', '$'
    newline DB 0DH, 0AH, '$'
    num DB 3

.CODE
MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09H
    LEA DX, M1
    INT 21H

    MOV CX, 5
    
print_loop:
    MOV AL, num
    SHL AL, 1
    CMP AL, 6
    JE Print6
    CMP AL, 8
    JE Print8
    CMP AL, 10
    JE Print10
    CMP AL, 12
    JE Print12
    CMP AL, 14
    JE Print15
    JMP after_print

Print6:
    MOV DL, '6'
    MOV AH, 02H
    INT 21H

    JMP after_print

Print8:
    MOV DL, '8'
    MOV AH, 02H
    INT 21H

    JMP after_print

Print10:
    MOV DL, '1'
    MOV AH, 02H
    INT 21H
    MOV DL, '0'
    MOV AH, 02H
    INT 21H

    JMP after_print

Print12:
    MOV DL, '1'
    MOV AH, 02H
    INT 21H
    MOV DL, '2'
    MOV AH, 02H
    INT 21H

    JMP after_print

Print15:
    MOV DL, '1'
    MOV AH, 02H
    INT 21H
    MOV DL, '5'
    MOV AH, 02H
    INT 21H

    JMP after_print

after_print:
    MOV AH, 09H
    LEA DX, newline
    INT 21H
    ADD NUM, 1
    LOOP check_jcxz
    JMP end_prog

check_jcxz:
    JCXZ end_prog
    JMP print_loop

end_prog:
    MOV AH, 4CH
    INT 21H

    MAIN ENDP
END MAIN