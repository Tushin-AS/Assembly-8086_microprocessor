; Read an integer from user. Check whether the number is positive or negative.

.MODEL SMALL
.STACK 100H

.DATA
    NUM DB ?
    MSG DB 0AH, 0DH, 'ENTER AN INTEGER: $'
    Pos_MSG DB 0AH, 0DH, 'Positive Number.$'
    Neg_MSG DB 0AH, 0DH, 'Negative Number.$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09H
    LEA DX, MSG
    INT 21H

    MOV AH, 01H
    INT 21H
    MOV BL, AL

    CMP BL, '-'
    JE Read_Negative

    SUB BL, '0'
    MOV NUM, BL
    JMP Check_Number

Read_Negative:
    MOV AH, 01H
    INT 21H
    SUB AL, '0'
    NEG AL
    MOV NUM, AL

Check_Number:
    MOV AL, NUM
    CMP AL, 0
    JL Print_Negative
    JG Print_Positive

Print_Positive:
    MOV AH, 09H
    LEA DX, Pos_MSG
    INT 21H
    JMP EXIT

Print_Negative:
    MOV AH, 09H
    LEA DX, Neg_MSG
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H

    MAIN ENDP
END MAIN