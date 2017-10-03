;11172 - Relational Operator

.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    
    MOV AH,1
    INT 21H    ;INPUT FOR TEST CASE 
    MOV CL,AL
    SUB CL,48  ; CL -= 48 
    
      MOV AH,2
      MOV DL,0AH
      INT 21H       ;; PRINT A NEW LINE
      MOV DL,0DH
      INT 21H
    
    LOOP:
    MOV AH,1
    INT 21H
    MOV BL,AL    ;TAKING INPUT FOR THE DEGIT
    
    MOV AH,2
    MOV DL,' '   ; PRINT A SPACE
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    CMP BL,BH
    JL LESS           ; JUMP IF BL IS LESS THAN BH
    JG GREATER        ; JUMP IF BL IS GREATER THA BH
    JE EQUAL          ; JUMP IF BL == BH
    
    LESS:
    
      MOV AH,2
      MOV DL,0AH
      INT 21H       ;; PRINT A NEW LINE
      MOV DL,0DH
      INT 21H
      
      MOV DL,'<'
      INT 21H               ; PRINT < 
      JMP CONTINUE_TO_LOOP
      
      
    GREATER:
      MOV AH,2
      MOV DL,0AH
      INT 21H       ;; PRINT A NEW LINE
      MOV DL,0DH
      INT 21H
      
      MOV DL,'>'
      INT 21H                 ; PRINT >
      JMP CONTINUE_TO_LOOP
      
    
    EQUAL:
     MOV AH,2
      MOV DL,0AH
      INT 21H       ;; PRINT A NEW LINE
      MOV DL,0DH
      INT 21H
      
      MOV DL,'='
      INT 21H
      JMP CONTINUE_TO_LOOP   
    
    CONTINUE_TO_LOOP:
    MOV AH,2
      MOV DL,0AH
      INT 21H       ;; PRINT A NEW LINE
      MOV DL,0DH
      INT 21H
    
    
    DEC CL ; C--
    CMP CL,0
    JGE LOOP  ; JUMP IF CL IS GREATER THAN 0 
    
    
    
    
    EXIT:
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN