;10055 - Hashmat the Brave Warrior

.MODEL SMALL
.STACK 100H  
.DATA

STRING DB 'ENTER A DIGIT :$'
.CODE

MAIN PROC 
    
     
     LOOP:
     
     ; taking the firs input
     MOV AH,1
     INT 21H       
    
     MOV BL,AL 
     
     ; print a space
     MOV AH,2
     MOV DL,' '  
     INT 21H
     
     ; for 2nd input 
     MOV AH,1    
     INT 21H
     
     MOV BH,AL 
     
     ;comparing two inputs
     
     
     CMP BH,BL
     JG L1  ;jump if bh>bl 
     
     ; as bl is greate than bh, bl-=bh
     
     SUB BL,BH
     MOV BH,BL      
     ADD BH,48   ;adding 48 for ascci valu
     JMP L2
     
     L1:
     ; as bh is greater than bl bh-=bl
     
     
     
     SUB BH,BL
     ADD BH,48     ;adding 48 for ascci valu
     
     L2:  
     
     ;for output
        
        MOV AH,2 
        MOV DL,0DH           ; print a new line
        INT 21H
        MOV DL,0AH
        INT 21H 
                  
        MOV DL,BH       ; print the output
        INT 21H 
        
        MOV DL,0DH
        INT 21H
        MOV DL,0AH         ; print a newline
        INT 21H
        
     JMP LOOP
  
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
        END MAIN

ret




