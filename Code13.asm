; Output Tracing Code

.MODEL SMALL
.STACK 100H

.DATA
    PH DB 1
    XH DB 33H
    ZH DB 35H
    HMSG DB " Stress $"
    BMSG DB "No Stress$"
    NEWLINE DB 10, 13, '$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CH, PH
    MOV CL, 8D

P0:
    MOV BH, PH
    CMP CH, CL
    JL P1
    JE P2
    JG exit

P1:
    ADD BH, 30H
    MOV AH, 2
    MOV DL, BH
    INT 21H
    INC CH
    ADD PH, 2
    JMP P2

P2:
    CMP BH, XH
    JE PRINT
    MOV AH, 9
    LEA DX, NEWLINE
    INT 21H
    INC CH
    JMP P0

PRINT:
    MOV AH, 9
    LEA DX, HMSG
    INT 21H

    MOV BH, 30H
    MOV AL, ZH
    MOV XH, AL
    JMP P2

exit:
    MOV AH, 9
    LEA DX, BMSG
    INT 21H
    MOV AH, 2
    MOV DL, CH
    INT 21H

    MOV AH, 4CH
    INT 21H

    MAIN ENDP
END MAIN