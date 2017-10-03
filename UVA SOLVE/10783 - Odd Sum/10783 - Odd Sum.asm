;10783 - Odd Sum
.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    
    MOV AH,1
    INT 21H
    MOV CL,AL
    SUB CL,30H
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH   ;; PRINT A NEW LINE
    INT 21H
    
    LOOP:
    MOV AH,1
    INT 21H
    MOV BH,AL;;;; TAKING THE FIRST INPUT
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH   ;; PRINT A NEW LINE
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL    ;;; TAKING THE SECOND INPUT
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH   ;; PRINT A NEW LINE
    INT 21H
    
    SUB BH,30H
    SUB BL,30H
    
    MOV AL,BH
    ADD AL,48
    
    LOOP2:
    
    SUB AL,2
    
    
    CMP AL,1
    JG LOOP2
    JE ODD
    JL EVEN
    
    
    
    ODD: 
       MOV CH,0
      JMP LOOP3 
      
    
    EVEN:
     ADD BH,1
    
    MOV CH,0;
    
    LOOP3:
    
    ADD CH,BH
                       ;;;FOR SUMMING 
    
    ADD BH,2
    
    CMP BH,BL
    JLE LOOP3
    
    ADD CH,48    
    
    MOV DL,CH
    INT 21H
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    DEC CL    ; CL--
    CMP CL,0  ; 
    JG LOOP    
    
    EXIT:
    
        MOV AH,4CH
        INT 21H
        MAIN ENDP
END MAIN