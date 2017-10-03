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
    
     MOV V1,0     ; IS THE FIRST INPUT
     
 
     INPUT1:
     
     
     MOV AH,1
     INT 21H
     
     MOV BL,AL   ; TAKE THE FIRST INPUT UNTILL THE SPACE
     
     SUB BL,30H
     
     CMP AL,32     
     
     JNE MAKE_NUMBER1
     
     
     JMP INPUT2
     
     
     MAKE_NUMBER1:
     
     AND AX,0            ; AX = 0
                        
     MOV AX,V1           ; AX = V1
                         
     MUL V3              ; AX*=10     
                         ; AX+=BX
     ADD AX,BX
                         ; STORE THE NUMBER IN FIRST VARIABLE
     MOV V1,AX  
     
     JMP INPUT1
     
     
     INPUT2:
     
     MOV AH,1
     INT 21H
        
     AND BX,0       ; TAKE THE SECOND INPUT
     MOV BL,AL
     
     SUB BL,30H
     
     CMP AL,13
     
     JNE MAKE_NUMBER2 
     
     MOV CX,V1
     MOV V1T,CX
     MOV CX,V2         ; V1T = V1
                       ; V2T = V2
     MOV V2T,CX
     
     JMP LOOP1
     
     
     MAKE_NUMBER2: 
     
     
     AND AX,0      ; AX = 0
     
     MOV AX,V2     ; AX = V2
     
     MUL V3        ; AX *= V3 WHERE V3 = 10
     
     ADD AX,BX     ; AX+=BX
     
     MOV V2,AX     ; STORE THE NUMBER IN V2
     
     JMP INPUT2 
     
     
     
     
     LOOP1:       ; FIRST LOOP START
        
        MOV TEMP,0     ; TEMP = 0
        
        MOV CX,V1T     ; 
        MOV N,CX       ; N = V1T
        
        MOV CX,2       ; CX = 2
        AND DX,0       ; DX = 0
        
        LOOP2:         ; LOOP2 START
        
        INC TEMP      ; TEMP++
        
        MOV AX,N      ; AX = N
        
        CMP AX,1      ; COMPARE AX WITH 1
        JE END_LOOP2  ; IF AX IS 1 THEN BREAK LOOP2
        
        DIV CX        ; AX /= CX WHERE REM IS DX
        
        CMP DX,1      ; COMPARE DX WITH 1
        JNE EVEN      ; IF DX IS NOT 1 THEN JUMP TO EVEN
        
        ;ODD
        MOV AX,N      ; AX = N
        MOV BX,3      ; BX = 3
        MUL BX        ; AX*=BX
        ADD AX,1      ; AX+=1
        MOV N,AX      ; N = AX
        
        JMP LOOP2     ; JUMP LOOP2
        
        EVEN:
        
        MOV N,AX      ; N=AX BECAUSE THE RESULT OF THE DIVTION WAS IN AX WHERE AX DIVIDED BY 2
        
        JMP LOOP2     ; JUMP LOOP
        
        
        
        
      END_LOOP2:
      
      MOV BX,TEMP
                            ; TEMP IS GREATER THAN R THEN R = TEMP
      CMP BX,R
      JL CONTINUE_LOOP1
      MOV R,BX
       
      
      CONTINUE_LOOP1:
        
      INC V1T          ; V1T ++
      
      MOV DX,V2T
      CMP V1T,DX       ; COMPARE V1T AND V2T IF V1T<=V2T THEN CONTINUE LOOP1
      JLE LOOP1  
     
      CALL print_newline   ; PRINT A NEWLINE
      
      AND AX,0        ; AX = 0
      MOV AX,V1       ; AX = V1
      
      
      AND BX,0        ; BX = 0
      
      MOV BX,20H
      
      STORE_V1: 
      
      AND DX,0       ; DX = 0
      
      DIV V3         ; AX/=V3 WHERE V3 = 10
      
      MOV [0000H+BX],DX ; STORE DX IN THE MEMORY
      
      ADD BX,2H
      
      CMP AX,0
      JNE  STORE_V1
      
      PRINT_V1:
       sub bx,2h         ; BX-=2H
    
       mov dx,[0000h+bx] ; MOVE TO DX FROM MEMORY
        add dx,30h       ; TO PRINT THE DIGIT
       mov ah,2
       int 21h          
       cmp bx,20H
       JNE PRINT_V1
       
       
       MOV DX,' '       ; PRINT A SPACE
       
       INT 21H
        
        
       AND AX,0
      MOV AX,V2T
      
      STORE_V2: 
      
      AND DX,0
      
      DIV V3
      
      MOV [0000H+BX],DX ; SAME ABOVE
      
      ADD BX,2H
      
      CMP AX,0
      JNE  STORE_V2
      
      PRINT_V2:
       sub bx,2h
    
       mov dx,[0000h+bx] 
        add dx,30h
       mov ah,2
       int 21h
       cmp bx,20H
       JNE PRINT_V2
       
       
       MOV DX, ' '
       INT 21H
      
      
      
      AND AX,0
      
      MOV AX,R
      
      MOV BX,0020H
      
      
      STORE:
      AND DX,0
      
      DIV V3                        ; SAME AS ABOVE
      
      MOV [0000H+BX],DX
      
      ADD BX,2H
      
      CMP AX,0
      JNE STORE
      
      
      
      
      PRINT:
      
       sub bx,2h
    
       mov dx,[0000h+bx] 
        add dx,30h
       mov ah,2
       int 21h
       cmp bx,20H
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