.MODEL SMALL 
.STACK 100H
.DATA
UCASE DB 'THE INPUT IS UPPER CASE $'  
LCASE DB 'THE INPUT IS LOWER CASE $'
DCASE DB 'THE INPUT IS DIGIT$'
SCASE DB 'THE INPUT IS SPECIAL CHARACTER $'

.CODE

MAIN PROC
    
    MOV AX,@DATA  ;;; INITIALIZE THE DATA SEGMENT
    MOV DS,AX
     
     MOV AH,1  ; TAKING INPUT FROM USER
     INT 21H
     
     MOV CL,AL  ; CL = AL
     
     CMP CL,48
     JGE DIGIT_CASE ;; IF((CL>= 48))
     
     JMP SPECIAL_CASE ;; IF THE CONDITION IS FALSE

DIGIT_CASE:        
     CMP CL,58      
     JGE UPPER_CASE ;; IF((CL<= 57)) 
     
     MOV AH,2
      MOV DL,0AH
      INT 21H        ;; print new line
      MOV DL,0DH
      INT 21H
     
     MOV AH,9
     LEA DX,DCASE
     INT 21H                               
     JMP EXIT
     
UPPER_CASE:

     CMP CL,65       
     JGE UPPER_CASE2 ;; IF((CL<= 65))
     
     JMP SPECIAL_CASE
     
     
     
     
UPPER_CASE2:
      CMP CL,91
      JGE LOWER_CASE  ;(if (cl>=91)
      
      MOV AH,2
      MOV DL,0AH
      INT 21H
      MOV DL,0DH
      INT 21H 
      
      MOV AH,9
      LEA DX,UCASE
      INT 21H
      JMP EXIT
     
LOWER_CASE:

      CMP CL,97
      JGE LOWER_CASE2
      JMP SPECIAL_CASE  
      
LOWER_CASE2:

      CMP CL,123
      JGE SPECIAL_CASE
      
      MOV AH,2
      MOV DL,0AH
      INT 21H
      MOV DL,0DH
      INT 21H
      
      MOV AH,9
      LEA DX,LCASE
      INT 21H
      
      JMP EXIT

SPECIAL_CASE:

       MOV AH,2
      MOV DL,0AH
      INT 21H
      MOV DL,0DH
      INT 21H

       MOV AH,9
       LEA DX,SCASE
       INT 21H

     
     
     
     
     EXIT:
     
     MOV AH,4CH
     INT 21H
     
    
    MAIN ENDP
END MAIN