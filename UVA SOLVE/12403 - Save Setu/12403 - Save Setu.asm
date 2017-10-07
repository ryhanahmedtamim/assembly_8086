;12403 - Save Setu

.model small
.stack 100h
.data

n db 0

.code 

main proc 
    
      MOV AX,@DATA
      MOV DS,AX     ; INITILIZE THE DATA SEGMENT
      
      mov ah,1
      int 21h
      mov cl,al
      sub cl,48
      call newline
      
      loop1:
        
        mov bl,0 
        
        ; taking the string
        
          loop2:
          
          mov ah,1
          int 21h
          
          cmp al,13
          je loop2end
          
          cmp bl,0
          jne loop2
          
          inc bl
          mov bh,al
          
          
        
        jmp loop2:
        
        loop2end:
        
        call newline
        
        cmp bh,64h
        jne print_the_result
        
        mov ah,1
        int 21h
        sub al,48
        add n,al ; n+=al 
        
        jmp continue_loop2
      
        print_the_result:
        add n,48
        mov ah,2
        mov dl,n
        int 21h
        sub n,48
       
       continue_loop2:
       call newline
       dec cl
       cmp cl,0
       je exit
       
      jmp loop1
    
    
    
    exit:
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