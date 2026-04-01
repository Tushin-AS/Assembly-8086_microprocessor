.MODEL SMALL
.STACK 100H

.DATA
    NEWLINE    DB 13, 10, '$'
    SPACES     DB ' $'         ; Single space + $
    STARS      DB '*$'         ; Single star + $
    TOTAL_ROWS DW 5            ; Total height of the pyramid

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    ; Initialize SI as the row counter (Current Row = 1)
    MOV SI, 1 
    
ROW_LOOP:
    ; --- Step 1: Calculate and print spaces ---
    ; Formula: Spaces = TOTAL_ROWS - Current Row (SI)
    MOV CX, TOTAL_ROWS
    SUB CX, SI         ; CX now holds the number of spaces to print
    JZ  PRINT_STARS    ; If CX is 0 (last row), jump straight to stars
    
SPACE_LOOP:
    LEA DX, SPACES     ; LEA instruction to load space address
    MOV AH, 09H
    INT 21H
    DEC CX
    JMP SPACE_LOOP_CHECK

SPACE_LOOP_CHECK:
    CMP CX, 0
    JNE SPACE_LOOP     ; JMP instruction for manual loop control

PRINT_STARS:
    ; --- Step 2: Calculate and print stars ---
    ; Formula: Stars = (Current Row * 2) - 1
    MOV AX, SI
    MOV BL, 2
    MUL BL             ; AL = SI * 2
    DEC AL             ; AL = (SI * 2) - 1
    
    MOV CL, AL
    MOV CH, 0          ; Move result into CX for the LOOP instruction
    
STAR_LOOP:
    LEA DX, STARS      ; LEA instruction for star address
    MOV AH, 09H
    INT 21H
    LOOP STAR_LOOP     ; Standard LOOP (uses CX)
    
    ; --- Step 3: Print newline ---
    LEA DX, NEWLINE
    MOV AH, 09H
    INT 21H
    
    ; --- Step 4: Increment row and check if done ---
    INC SI             ; Next row
    CMP SI, TOTAL_ROWS
    JLE ROW_LOOP       ; If SI <= 5, JMP back to start next row
    
    ; Exit program
    MOV AH, 4CH
    INT 21H
    
    MAIN ENDP
END MAIN