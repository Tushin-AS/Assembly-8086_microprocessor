; Write a 8086 assembly program to check whether a given input character is vowel or not.

.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 'Enter a character: $'
    MSG2 DB 0DH, 0AH, 'It is a VOWEL.$'
    MSG3 DB 0DH, 0AH, 'It is NOT a VOWEL.$'

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
    JB CHECK_VOWEL
    CMP BL, 'z'
    JA CHECK_VOWEL

    SUB BL, 20H

CHECK_VOWEL:
    CMP BL, 'A'
    JE Is_Vowel
    CMP BL, 'E'
    JE Is_Vowel
    CMP BL, 'I'
    JE Is_Vowel
    CMP BL, 'O'
    JE Is_Vowel
    CMP BL, 'U'
    JE Is_Vowel

    JMP Not_Vowel

Is_Vowel:
    MOV AH, 09H
    LEA DX, MSG2
    INT 21H

    JMP EXIT

Not_Vowel:
    MOV AH, 09H
    LEA DX, MSG3
    INT 21H

    JMP EXIT

EXIT:
    MOV AH, 4CH
    INT 21H

    MAIN ENDP
END MAIN