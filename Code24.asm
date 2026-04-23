; Write a 8086 Assembly code that takes an input character from the user.
; Check it for number and find whether it is odd or even using TEST instruction.

.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 0DH, 0AH, 'Enter a Number(0-9): $'
    MSG2 DB 0DH, 0AH, 'Input is NOT A NUMBER.$'
    MSG_ODD DB 0DH, 0AH, 'It is a ODD number.$'
    MSG_EVEN DB 0DH, 0AH, 'It is a EVEN number.$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09H
    LEA DX, MSG1
    INT 21H

    MOV AH, 01H
    INT 21H

    CMP AL, '0'
    JB Not_A_Number

    CMP AL, '9'
    JA Not_A_Number

    TEST AL, 01H
    JZ Is_Even
    JMP Is_Odd

Not_A_Number:
    MOV AH, 09H
    LEA DX, MSG2
    INT 21H
    JMP EXIT

Is_Even:
    MOV AH, 09H
    LEA DX, MSG_EVEN
    INT 21H
    JMP EXIT

Is_Odd:
    MOV AH, 09H
    LEA DX, MSG_ODD
    INT 21H
    JMP EXIT

EXIT:
    MOV AH, 4CH
    INT 21H

    MAIN ENDP
END MAIN
