;11689 - Soda Surpler
.model small
.stack 100h
.data
v db ?
.code

main proc
     
     MOV AX,@DATA
     MOV DS,AX     ; INITILIZE THE DATA SEGMENT
    
    mov ah,1
    int 21h
    
    mov cl,al
    
    sub cl,48 
    
    call newline
    
    test_case:
     and v,0
    
    
    mov ah,1 ; 
    int 21h
    mov bl,al
    sub bl,48
    
    ;print a space
    
    mov ah,2
    mov dl,' '
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    add bl,al
    
     
    ;print a space
    
    mov ah,2
    mov dl,' '
    int 21h
    
    
    mov ah,1
    int 21h
    sub al,48
    
    mov bh,al
    
    call newline 
    
    loop2:
    
    and ax,0
    mov al,bl
    
    div bh
    
    add v,al
    
    add al,ah
    
    mov bl,al
    
    cmp bl,bh 
    
    jge loop2
    
    add v,48
    mov dl,v
    
    mov ah,2
    int 21h
    
    call newline
    
     
        
        
        
    loop test_case    
        
        
    mov ah,4ch
    int 21h
        
        
    main endp 

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
        
end main