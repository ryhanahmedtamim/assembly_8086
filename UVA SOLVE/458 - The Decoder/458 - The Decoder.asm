;458 - The Decoder
.model small
.stack 100h
.data
a db 100 dup(1)
.code

main proc
    
    mov ax,@data
    mov ds,ax
    
    loop1:
        mov si,0 
        loop2:        
            mov ah,1
            int 21h
            mov a[si],al ;a[i] = al
            inc si ; si++        
            cmp al,13d
         jne loop2
         call newline         
         mov si,0         
         loop3:
            sub a[si],7 ;a[i]-=7
            mov ah,2
            mov dl,a[si]
            int 21h            
            inc si ;si++
            cmp a[si],13d         
         jne loop3 
         call newline            
    jmp loop1        
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