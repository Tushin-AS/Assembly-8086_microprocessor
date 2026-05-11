.MODEL SMALL
.STACK 100H

.DATA
    CHAR DB 'Q'

.CODE
MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX

    MOV DL, CHAR

    CMP DL, 'A'
    JB Exit_if

    CMP DL, 'Z'
    JA Exit_if

    MOV AH, 02H
    INT 21H

Exit_if:
    MOV AH, 4CH
    INT 21H

    MAIN ENDP
END MAIN