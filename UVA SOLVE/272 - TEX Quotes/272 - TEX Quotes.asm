;272 - TEX Quotes
.model small
.stack 100h
.data
a db 100 dup(-1)
count dw 0
d db 2
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
          loop3:
            ;printing the characters
            cmp a[si],'"'
            jne print
                inc count
                ;for division    
                mov ax,count
                div d                
                cmp ah,0
                jne print_cout
                    mov ah,2
                    mov dl,39
                    int 21h
                    int 21h
                jmp not_print
                  
               print_cout:
                    mov ah,2
                    mov dl,96
                    int 21h
                    int 21h
            jmp not_print
            
            print:
            mov ah,2
            mov dl,a[si]
            int 21h 
            not_print:
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