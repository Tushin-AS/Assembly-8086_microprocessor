.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 0AH, 0DH, 'Enter Two Integers: $'
    MSG2 DB ' AND $'
    MSG3 DB 0AH, 0DH, 'Summation = $'
    NUM1 DB ?
    NUM2 DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Print first message
    MOV AH, 09H
    LEA DX, MSG1
    INT 21H

    ; Input first digit (ASCII)
    MOV AH, 01H
    INT 21H
    SUB AL, 30H        ; Convert ASCII to decimal (ASCII 48='0')
    MOV NUM1, AL       ; Store decimal value

    ; Print "AND"
    MOV AH, 09H
    LEA DX, MSG2
    INT 21H

    ; Input second digit (ASCII)
    MOV AH, 01H
    INT 21H
    SUB AL, 30H        ; Convert ASCII to decimal
    MOV NUM2, AL       ; Store decimal value

    ; New line
    MOV AH, 02H
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H

    ; Print third message
    MOV AH, 09H
    LEA DX, MSG3
    INT 21H

    ; Calculate sum (decimal values)
    MOV AL, NUM1
    ADD AL, NUM2
    ADD AL, 30H        ; Convert sum to ASCII

    ; Display sum
    MOV AH, 02H
    MOV DL, AL
    INT 21H

    MOV AH, 4CH
    INT 21H

    MAIN ENDP
END MAIN