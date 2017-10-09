;11388 - GCD LCM

.MODEL SMALL
.STACK 100H
.DATA 
V1 DB ?
V2 DB ?
.CODE

MAIN PROC 
     
     MOV AX,@DATA
     MOV DS,AX     ; INITILIZE THE DATA SEGMENT
    
    
    MOV AH,1
    INT 21H
    
    
    AND CX,0
    
    MOV CL,AL
    SUB CL,48
    
    CALL NEWLINE
    
    LOOP1:
    
    
    MOV AH,1
    INT 21H
    
    MOV BL,AL ; SMALL INPUT 
    SUB BL,48
    MOV V1,AL
    
    ; PRINT A SPACE
    
    MOV AH,2
    MOV DL,' '
    INT 21H
    
    
    MOV AH,1
    INT 21H
    
    MOV V2,AL
    
    AND DX,0
    
    MOV DL,AL
    SUB DL,48
    
    CALL NEWLINE
    
    MOV AX,DX
    
    DIV BL
    
    
    CMP AH,0
    
    JNE PRINT_NEGATIVE_1
    
    MOV AH,2
    MOV DL,V1 
    
    INT 21H
    
    MOV DL, ' '
    INT 21H
    
    MOV DL,V2
    INT 21H
    
    CALL NEWLINE
    
    LOOP LOOP1
    
    PRINT_NEGATIVE_1:
    
    MOV DL,'-'
    MOV AH,2
    INT 21H
    
    MOV DL,'1'
    INT 21H 
    
      CALL NEWLINE
    
    
    LOOP LOOP1
    
    MOV AH,4CH
    INT 21H
    
    
    MAIN ENDP

 NEWLINE PROC
        
        PUSH AX
        PUSH DX
        
        
        MOV AH,2
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H
        
        POP DX
        POP AX
        
        
        RET
        
        NEWLINE ENDP
 
 END MAIN
