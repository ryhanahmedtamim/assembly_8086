;10071 - Back to High School Physics
.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    
    LOOP:
    
    MOV AH,1
    INT 21H
    
    MOV BL,AL 
    SUB BL,48
    
    MOV AH,2
    MOV DL, ' '
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    sub al,48
    
    
    mov cl,1 
    cmp bl,1
    je level
    
    loop2:
     
      add bh,al
      
      inc cl
      cmp cl,bl
     jl loop2
     
     
    level:
       mov al,bh
       sub al,48
     
      add bh,al

     
     mov ah,2
     mov dl,0ah
     int 21h
     mov dl,0dh
     int 21h
     mov dl,bh
     int 21h
     mov dl,0ah
     int 21h
     mov dl,0dh
     int 21h
    
    JMP LOOP  
    
    mov ah,4ch
    int 21h
    
    main endp
end main