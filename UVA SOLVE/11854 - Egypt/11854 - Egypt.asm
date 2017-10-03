;11854 - Egypt


.MODEL SMALL
.STACK 100H
.DATA
V5 DW ?
V1 DW ?
V2 DW ?
V3 DW ?
V4 DW 10 
RIGHT_MG DB 'right $'
WRONG_MG DB 'wrong $'

.CODE

MAIN PROC
     
     MOV AX,@DATA
     MOV DS,AX     ; INITILIZE THE DATA SEGMENT
    
    ; TAKING INPUT 1
    
    AND V1,0   ; v1 =0
    AND V2,0   ; v2 = 0   
    AND V3,0   ; v3 = 0
    
    INPUT1:
    
    MOV AH,1
    INT 21H
    AND BX,0     ; bx = 0
    
    MOV BL,AL
    SUB BX,30H
    
    CMP AL,32
    JNE MAKE_NUMBER1
    
    JMP INPUT2
    
    
    MAKE_NUMBER1:
    AND AX,0
    MOV AX,V1
    MUL V4
    ADD AX,BX
    MOV V1,AX
    JMP INPUT1
    
    
    ; TAKING INPUT 2
    
    INPUT2:
    
    MOV AH,1
    INT 21H
    AND BX,0
    MOV BL,AL
    SUB BL,30H
    
    CMP AL,32
    JNE MAKE_NUMBER2
    JMP INPUT3
    
    
    
    MAKE_NUMBER2:
    AND AX,0
    MOV AX,V2
    MUL V4
    ADD AX,BX
    
    MOV V2,AX
    
    JMP INPUT2
    
    
    
    INPUT3:
    
    MOV AH,1
    INT 21H
    
    AND BX,0
    
    MOV BL,AL
    
    SUB BL,30H
    
    CMP AL,13
    JNE MAKE_NUMBER3
    JMP COMPARE_3_INPUTS
    
    MAKE_NUMBER3:
    
    AND AX,0
    MOV AX,V3
    MUL V4
    ADD AX,BX
    MOV V3,AX
    
    JMP INPUT3
    
    COMPARE_3_INPUTS:
    
    MOV AX,V1
    MOV BX,V2
    MOV CX,V3
    
    CMP AX,0
    JNE SORT
    
    CMP BX,0
    
    JNE SORT
    
    CMP CX,0
    JNE SORT
    JMP EXIT
    
     
    SORT: 
     
    ; COMPARE WITH AX AND BX
    
    CMP AX,BX
    JG SWAP_AX_BX
    JMP COMPARE_AX_CX
    
    SWAP_AX_BX:
    
    MOV DX,AX
    MOV AX,BX
    MOV BX,DX
    
    COMPARE_AX_CX:
    CMP AX,CX
    JG SWAP_AX_CX
    JMP COMPARE_BX_CX
    
    SWAP_AX_CX:
    MOV DX,AX
    MOV AX,CX
    MOV CX,DX
    
    COMPARE_BX_CX:
    CMP BX,CX
    JG SWAP_BX_CX
    JMP SQUARE
    
     SWAP_BX_CX:
     MOV DX,CX
     MOV CX,BX
     MOV BX,DX
     
     
     
    
     SQUARE:
     MOV V1,AX
     MOV V2,BX
     MOV V3,CX
     
     MUL V1
     MOV V1,AX
     
     MOV AX,V2
     MUL V2
     MOV V2,AX
     
     MOV AX ,V3
     MUL V3
     
     MOV V3,AX
     
     
     
     
     MOV BX,V1
     ADD BX,V2
     
     CMP BX,V3
     JE RIGHT
     
     JMP WRONG
     
      RIGHT:
       
       CALL NEWLINE
        
        MOV AH,9
        LEA DX,RIGHT_MG
        INT 21H
       
       CALL NEWLINE
      
      
      JMP ENDLINE
      
      WRONG:
      
      CALL NEWLINE
      
       MOV AH,9
       LEA DX,WRONG_MG
       INT 21H
      
      CALL NEWLINE 
      
      
      
      ENDLINE:
      
      AND V1,0
      AND V2,0
      AND V3,0
      
     
      JMP INPUT1
    
    EXIT:
      
      MOV AX,4CH
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
    END NEWLINE
    
    

END MAIN