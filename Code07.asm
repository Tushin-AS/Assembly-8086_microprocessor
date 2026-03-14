; take input of three uppercase alphabet characters &
; display them down the left margin in lowercase reverse alphabetical order.

.MODEL SMALL
.STACK 100H

.DATA
    MSG DB 'Enter 3 Initials: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09H
    LEA DX, MSG
    INT 21H

    ; INPUT 1ST LETTER
    MOV AH, 01H
    INT 21H
    MOV BL, AL

    ; INPUT 2ND LETTER
    MOV AH, 01H
    INT 21H
    MOV BH, AL

    ; INPUT 3RD LETTER
    MOV AH, 01H
    INT 21H
    MOV CL, AL

    ADD BL, 20H
    ADD BH, 20H
    ADD CL, 20H

    MOV AH, 02H
    MOV DL, 0DH     ; New Line create
    INT 21H         ;--
    MOV DL, 0AH     ;--
    INT 21H         ;--

    ; print 3rd letter
    MOV DL, CL
    INT 21H

    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H

    ; print 2nd letter
    MOV DL, BH
    INT 21H

    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H

    ; print 1st letter
    MOV DL, BL
    INT 21H

    MOV AH, 4CH
    INT 21H

    MAIN ENDP
END MAIN