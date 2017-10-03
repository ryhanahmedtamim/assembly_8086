.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC
        
        MOV AH,1
        INT 21H
        MOV BH,AL  
        
        MOV AH,1
        INT 21H
        MOV CH,AL
        
        ADD BH,CH 
        SUB BH,30H
        
        MOV AH,2
        MOV DL,BH
        INT 21H 
        
         
        
        MOV AH, 4CH
        INT 21H
        
END MAIN

    
        
        