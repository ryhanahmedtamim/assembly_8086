;382 - Perfection
.MODEL SMALL 
.STACK 100H
.DATA

PF DB 'PERFECTION OUTPUT $'
D_N DB ' DEFICIENT $'
P_N DB ' PERFECT $'
PL DB 'END OF OUTPUT $'
D DB 1

.CODE 

MAIN PROC
    
      
      MOV AX,@DATA
      MOV DS,AX     ; INITILIZE THE DATA SEGMENT
      
      
                                                 
                                                 
      ; PRINT THE FIRST STATEMENT
      
       MOV AH,9
       LEA DX,PF
       INT 21H
       
      ; CALL NEWLINE 
      
      ;PRINT NEWLINE 
       
        MOV AH,2
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H   
        
       
       LOOP1:
       
       AND D,0
       MOV D,1
       
       
       
           MOV AH,1
           INT 21H
           
           MOV BL,AL
           
           SUB BL,48
           
           CMP BL,0 
           JE EXIT
           
           
          
          
          MOV CL,00H  ; CL = 0
          AND AX,0 ; AX = 0
          
          
          
          LOOP2:
          
           MOV AL,BL
           
           DIV D
           
           CMP AH,0
           JNE CONTINUE_LOOP2
           
            ADD CL,D
          
           
          
          CONTINUE_LOOP2:
          
          INC D
          
          CMP D,BL
          JL LOOP2
          
          
          
          CMP BL,CL
          JNE NOT_PARFECT 
       
       
       
       ; PRINT NEWLINE 
        MOV AH,2
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H
        
        ;PRINT THE OUTPUT 
        ADD BL,48
        
        MOV DL,BL
        INT 21H
        
        MOV DL,' '
        INT 21H
        
        
        
       MOV AH,9
       LEA DX,P_N
       INT 21H
          
        ; PRINT NEWLINE 
        MOV AH,2
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H
        
         JMP LOOP1  
          
           
          NOT_PARFECT:   
      
           ; PRINT NEWLINE 
        MOV AH,2
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H
        
        ;PRINT THE OUTPUT
        ADD BL,48
        
        MOV DL,BL
        INT 21H
        
        MOV DL,' '
        INT 21H
        
        
        MOV AH,9
        LEA DX,D_N
        INT 21H
          
        ; PRINT NEWLINE 
        MOV AH,2
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H 
        
        
      
      JMP LOOP1
           
           
           
                 
     
     
     EXIT:
      
         ; PRINT NEWLINE 
        MOV AH,2
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H
      
     
     MOV AH,9
     LEA DX,PL
     INT 21H
     ;CALL NEWLINE
       
    
    
    MOV AH,4CH
    INT 21H
    
   MAIN ENDP 
    

END MAIN