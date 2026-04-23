; Output Tracing

.MODEL SMALL
.STACK 100H

.DATA
    m1 DB 'r$'
    m2 DB 0DH, 0AH, '$'
    m3 DB 0DH, 0AH, '$'
    m4 DB 0DH, 0AH, '$'
    m5 DB 0DH, 0AH, '$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09H
    LEA DX, m1
    INT 21H

    MOV BL, 'r'
    SUB BL, 20H

    MOV AH, 09H
    LEA DX, m2
    INT 21H
    MOV AH, 02H
    MOV DL, BL
    INT 21H

    MOV AH, 09H
    LEA DX, m3
    INT 21H

    MOV BH, BL
    MOV CX, 8

L1:
    ROL BH, 1
    JNC L2
    MOV DL, '1'
    JMP L3

L2:
    MOV DL, '0'

L3:
    MOV AH, 02H
    INT 21H
    LOOP L1

    MOV AH, 09H
    LEA DX, m4
    INT 21H
    NOT BL
    MOV BH, BL
    MOV CX, 8

L4:
    ROL BH, 1
    JNC L5
    MOV DL, '1'
    JMP L6

L5:
    MOV DL, '0'

L6:
    MOV AH, 02H
    INT 21H
    INT 21H
    LOOP L4

    MOV AH, 09H
    LEA DX, m5
    INT 21H
    NOT BL
    MOV BH, BL
    MOV CX, 8

L7:
    ROL BH, 1
    JNC L8
    MOV DL, '1'
    JMP L9

L8:
    MOV DL, '0'

L9:
    MOV AH, 02H
    INT 21H
    LOOP L7

    MOV AH, 4CH
    INT 21H

    MAIN ENDP
END MAIN