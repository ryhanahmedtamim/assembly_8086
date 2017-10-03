; 3n+1

.model small
.stack 100h
.DATA 

 V1 DW ?
 V2 DW ?
 V3 DW 10
 TEMP DW ?
 V1T DW ?
 V2T DW ?
 R DW 0
 N DW ?
.code

main proc
    
     MOV AX,@DATA ; INTILIZATION OF DATA SEGMENT
     MOV DS,AX 
    
     MOV V1,0
     
 
     INPUT1:
     
     
     MOV AH,1
     INT 21H 
     
     AND BX,0
     MOV BL,AL
     SUB BL,30H
     
     CMP AL,32     
     
     JNE MAKE_NUMBER1
     JMP INPUT2
     
     
     MAKE_NUMBER1:
     
     AND AX,0     
     MOV AX,V1
     
     MUL V3
     
     ADD AX,BX
     
     MOV V1,AX  
     
     JMP INPUT1
     
     
     INPUT2:
     
     MOV AH,1
     INT 21H
        
     AND BX,0 
     MOV BL,AL
     
     SUB BL,30H
     
     CMP AL,13
     
     JNE MAKE_NUMBER2 
     
     MOV CX,V1
     MOV V1T,CX
     MOV CX,V2
     MOV V2T,CX
     
     JMP LOOP1
     
     
     MAKE_NUMBER2: 
     
     
     AND AX,0
     
     MOV AX,V2
     
     MUL V3
     
     ADD AX,BX
     
     MOV V2,AX
     
     JMP INPUT2 
     
     
     
     
     LOOP1:
        
        MOV TEMP,0
        
        MOV CX,V1T
        MOV N,CX
        
        MOV CX,2
        AND DX,0
        
        LOOP2:
        
        INC TEMP
        
        MOV AX,N
        
        CMP AX,1
        JE END_LOOP2 
        
        DIV CX
        
        CMP DX,1
        JNE EVEN 
        
        ;ODD
        MOV AX,N
        MOV BX,3
        MUL BX
        ADD AX,1
        MOV N,AX
        
        JMP LOOP2
        
        EVEN:
        
        MOV N,AX
        
        JMP LOOP2
        
        
        
        
      END_LOOP2:
      
      MOV BX,TEMP
      
      CMP BX,R
      JL CONTINUE_LOOP1
      MOV R,BX
       
      
      CONTINUE_LOOP1:
        
      INC V1T
      
      MOV DX,V2T
      CMP V1T,DX
      JLE LOOP1  
     
      
      
      AND AX,0
      
      MOV AX,R
      
      MOV BX,0000H
      
      
      STORE:
      AND DX,0
      
      DIV V3
      
      MOV [0000H+BX],DX
      
      ADD BX,2H
      
      CMP AX,0
      JNE STORE
      
      CALL print_newline
      
      
      PRINT:
      
       sub bx,2h
    
       mov dx,[0000h+bx] 
        add dx,30h
       mov ah,2
       int 21h
       cmp bx,0
       JNE PRINT      
    
       
       
      CALL print_newline
      
      
      AND AX,0
      AND BX,0
      AND CX,0
      AND DX,0
      AND V1,0
      AND V2,0
      AND V1T,0
      AND V2T,0
      AND R,0
      AND TEMP,0
      AND N,0 
    
    
    
     
     
    JMP INPUT1    
        
        
        
        
        
        
        
    main endp

    print_newline proc
       
       push ax
       push dx
       
       mov ah,2
       mov dl,0dh
       int 21h
       mov dl,0ah
       int 21h
       
       pop dx
       pop ax                      
        
        RET      
                          
                          
        print_newline endp



end main