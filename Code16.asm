; Write a program to take a single lowercase alphabet as input. 
; Then print whether it is a vowel or a consonant. Then print the uppercase of the alphabet.

.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 0AH, 0DH, 'INPUT A lowercase alphabet (a-z): $'
    MSG_V DB 0AH, 0DH, 'It is a vowel. $'
    MSG_C DB 0AH, 0DH, 'It is a consonant. $'
    MSG2 DB 0AH, 0DH, 'UPPERCASE LETTER: $'

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

    CMP BL, 'a'
    JE VOWEL_TEXT
    CMP BL, 'e'
    JE VOWEL_TEXT
    CMP BL, 'i'
    JE VOWEL_TEXT
    CMP BL, 'o'
    JE VOWEL_TEXT
    CMP BL, 'u'
    JE VOWEL_TEXT

    JMP CONS_TEXT

VOWEL_TEXT:
    MOV AH, 09H
    LEA DX, MSG_V
    INT 21H

    JMP ALPHA_CONVERT

CONS_TEXT:
    MOV AH, 09H
    LEA DX, MSG_C
    INT 21H

    JMP ALPHA_CONVERT

ALPHA_CONVERT:
    MOV AH, 09H
    LEA DX, MSG2
    INT 21H

    SUB BL, 20H

    MOV AH, 02H
    MOV DL, BL
    INT 21H

    JMP EXIT

EXIT:
    MOV AH, 4CH
    INT 21H

    MAIN ENDP
END MAIN