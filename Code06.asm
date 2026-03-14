; Convert small letter to Capital letter.

.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 0AH, 0DH, 'Small Letter: $'
    MSG2 DB 0AH, 0DH, 'Capital Letter: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09H
    LEA DX, MSG1
    INT 21H

    MOV AH, 01H
    INT 21H
    MOV BL, AL

    SUB BL, 20H

    MOV AH, 09H
    LEA DX, MSG2
    INT 21H

    MOV AH, 02H
    MOV DL,  BL
    INT 21H

    MOV AH, 4CH
    INT 21H

    MAIN ENDP
END MAIN