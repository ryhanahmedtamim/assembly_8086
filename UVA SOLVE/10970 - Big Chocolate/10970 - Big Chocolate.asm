;10970 - Big Chocolate

.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC
        
        
   LOOP1:
   
   
   ;FOR 1ST INPUT
   
   MOV AH,1
   INT 21H
   
   MOV BL,AL 
   SUB BL,48
   
   ; PRINT A SPACE
   
   MOV AH,2
   MOV DL,' '
   INT 21H
   
   
   ;FOR 2ND INPUT
   
   MOV AH,1
   INT 21H
   MOV BH,AL
   SUB BH,48
   
   
   
   AND AX,0 ; AX = 0
   
   MOV AL,BH
   
   MUL BL   ; AX = AL*BL
   
   SUB AX,1  ; AX-=1
   
   AND BX,0 ; BX = 0
   
   
   MOV BX,AX
   ADD BL,48
   
   
   ;PRINT NEWLINE 
       
        MOV AH,2
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H 
        
   ;PRINT OUTPUT
   
        MOV DL,BL
        INT 21H
       ;NEW LINE
        
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H
   
   
   
   
   JMP LOOP1
        
    
    
    MOV AH,4CH
    INT 21H
    
   MAIN ENDP
END MAIN