; Output Tracing

.MODEL SMALL
.STACK 100H

.DATA
    m1 DB 'First Number: $'
    m2 DB 0AH, 0DH, 'Second Number: $'
    m3 DB 0AH, 0DH, 'Third Number: $'
    m4 DB 0AH, 0DH, 'Fourth Number: $'
    m5 DB 0AH, 0DH, 'Fifth Number: $'
    c1 DB ?
    c2 DB ?

.CODE
MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX

    MOV BH, 'A'
    MOV CX, 8
    MOV AH, 9
    LEA DX, m1
    INT 21H

L1:
    ROL BH, 1
    MOV AH, 2
    JNC L2
    MOV DL, '1'
    INT 21H
    LOOP L1
    JMP L3

L2:
    MOV DL, '0'
    INT 21H
    LOOP L1

L3:
    MOV AH, 9
    LEA DX, m2
    INT 21H
    MOV AH, 2
    SUB BH, 37H
    CMP BH, 10
    JGE L4
    MOV DL, BH
    ADD DL, 48H
    INT 21H

L4:
    MOV DL, BH
    ADD DL, 37H
    INT 21H

    MOV AH, 9
    LEA DX, m3
    INT 21H

    MOV AH, 2
    MOV c1, BH
    ADD c1, 28H
    MOV DL, c1
    INT 21H

    MOV AH, 9
    LEA DX, m4
    INT 21H

    MOV AH, 2
    MOV c2, BH
    ADD c2, 38H
    MOV DL, c2
    INT 21H

    MOV AH, 9
    LEA DX, m5
    INT 21H

    MOV AH, 2
    MOV DL, BH
    MOV DL, 39H
    INT 21H

    MOV AH, 4CH
    INT 21H

    MAIN ENDP
END MAIN