; 11727 - Cost Cutting

.MODEL SMALL
.STACK 100H
.DATA
STRINT DB 'Case $'
CASE  DB ?
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX     ; INITIALIZE THE DATA SEGMENT
    
    MOV AH,1
    INT 21H
    MOV CL,AL
    SUB CL,30H    ; TAKING THE INPUT FOR LOOP  
    MOV DL,49
    MOV CASE,DL
    
    MOV AH,2
    MOV DL,0AH
    INT 21H          ; PRINT A NEW LINE
    MOV DL,0DH
    INT 21H
    
    LOOP: 
    
    MOV AH,1
    INT 21H     ; TAKING THE FIRST INPUT
    MOV BL,AL   ; BL = AL
    
    ;PRINT A SINGLE SPACE
    
    MOV DL,' ' ; DL = ' '
    MOV AH,2
    INT 21H
      
    
    
    ; TAKING THE 2ND INPUT 
    
    MOV AH,1    
    INT 21H
    MOV BH,AL 
    
    
    ;PRINT A SINGLE SPACE
    
    MOV DL,' ' ; DL = ' '
    MOV AH,2
    INT 21H
    
    ;
    ; TAKING THE 3RD INPUT
    
    MOV AH,1
    
    INT 21H
    MOV CH,AL 
   
    
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    ; THE 1ST INPUT IS IN BL 
    ; THE 2ND INPUT IS IN BH
    ; THE 3RD INPUT IS IN CH
    
    
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    ; FIRST WE COMPARE WITH FIRST 2 INPUT 
    
    
    CMP BL,BH ;;; COMPARE WITH BL AND BH
    
    JG SWAP_BL_BH   ;;; IF BL IS GREATER THAN BH THEN JUMP
    JMP DONOT_SWAP
    
    
    SWAP_BL_BH:
    
    MOV AL,BL  ; AL = BL
    MOV BL,BH  ; BL = BH
    MOV BH,AL  ; BH = AH
    
     
    
    DONOT_SWAP: 
    
    ;;;;;;;;;;;;;;
    ; NOW WE COMPARE WITH 1ST AND LAST REGISTERE
    
    CMP BL,CH ;;;; COMPARE WITH BH AND CH
    JG SWAP_BL_CH  ; IF BH IS GREATER THAN CH THE JUMP 
    
    JMP DONOT_SWAP_BL_CL
              
    SWAP_BL_CH:
    
    MOV AL,BL  ; AL = BH
    MOV BL,CH  ; BH = CH
    MOV CH,AL  ; CH = AL
    
    
    DONOT_SWAP_BL_CL:
    
    ;; NOW WE COMPARE WITH BH AND CH
    
    CMP BH,CH
    JG SPWA_BH_CH
    JMP PRINT
    
    SPWA_BH_CH:
    
    MOV AL,CH ; AL = CH 
    MOV CH,BH ; CH = BH
    MOV BH,AL ; BH = AL
   
    
    PRINT:
    

    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH       ; print a new line 
    INT 21H  
    
    MOV AH,9
    LEA DX,STRINT    ;PRINT CASE :
    INT 21H
    
    MOV AH,2
    MOV DL,CASE
    INT 21H     
    
    MOV DL, ':'
    INT 21H
    
    MOV DL,' '
    INT 21H
    
    
    
    MOV DL,BH
    INT 21H
     
    CONTINUE_TO_LOOP:
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    INC CASE
    DEC CL  ; CL--
    CMP CL,0
    JG LOOP ; JUMP IF (CL >= 0)
        
    
    
    
    
    EXIT:
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN
    