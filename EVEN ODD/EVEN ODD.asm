.MODEL SMALL
.STACK 100H
.DATA
EVEN DB 'EVEN$' 
ODD DB 'ODD$'

.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,1
    INT 21H
    
    SUB AL,48
    
    CMP AL,0
    JE EVEN1
    CMP AL,1
    JE ODD1
    
    
    
    LOOP:
     
     SUB AL,2
    
    CMP AL,1
    JE ODD1
    CMP AL,0
    JE EVEN1
    JMP LOOP
    
    
    ODD1:
    
    MOV AH,9
    LEA DX,ODD
    INT 21H
    
    JMP EXIT
    
    
    EVEN1:
    
    MOV AH,9
    LEA DX,EVEN
    INT 21H
    
    EXIT:
         MOV AH,4CH
         INT 21H
         
         MAIN ENDP
END MAIN
    
    
    
    



