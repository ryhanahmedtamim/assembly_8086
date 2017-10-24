;1124 - Celebrity jeopardy

.model small
.stack 100h
.data
a db dup(-1)
.code

main proc
     
     mov ax,@data
     mov ds,ax
     
     loop1: 
          mov si,0
          mov ah,1
          loop2:
            int 21h
            mov a[si],al  ; s[i] = al, taking the character
            inc si     ; si++
            cmp al,13
          jne loop2
          
          call newline
          mov si,0
          mov ah,2
          
          loop3:
            ;printing the characters
            mov dl,a[si]
            int 21h
            inc si ;si++
            cmp a[si],13
          jne loop3
          
          call newline  
            
     jmp loop1
    
    exit:
    mov ah,4ch
    int 21h
    
    main endp
    
    newline proc
           push ax
           push dx
           
           mov ah,2
           mov dl,0ah
           int 21h
           mov dl,0dh
           int 21h
           
           pop dx
           pop ax                   
          ret 
          newline endp
end main