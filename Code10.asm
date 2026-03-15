; Write an assembly program that prints Hello World five times and then prints Bye world.

.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 0AH, 0DH, 'Hello, World! $'
    MSG2 DB 0AH, 0DH, 'Bye, World! $'
    COUNT DB 0

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

Print_Loop:
    MOV AH, 09H
    LEA DX, MSG1
    INT 21H

    INC COUNT
    CMP COUNT, 5    ; condition check
    JE Print_Bye    ; if true
    JMP Print_Loop  ; else block

Print_Bye:
    MOV AH, 09H
    LEA DX, MSG2
    INT 21H

    MOV AH, 4CH
    INT 21H

    MAIN ENDP
END MAIN