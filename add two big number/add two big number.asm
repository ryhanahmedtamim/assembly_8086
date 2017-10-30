.model small
.stack 100h
.data
a db 100 dup(?)
b db 100 dup(?) 
c db 101 dup(-1)
l dw ?
carry db 0
d db 10
len dw ?
.code
main proc
  
    mov ax,@data
    mov ds,ax
     
    mov si,0
    mov di,0  
    input1:
        mov ah,1
        int 21h
        cmp al,13
        je input1_end
        sub al,30h
        mov a[si],al
        inc si                          ; si++
     jmp input1        
     input1_end:
     call newline
     input2:   
          mov ah,1
          int 21h
          cmp al,13
          je input2_end   
          sub al,30h
          mov b[di],al
          inc di                        ; di++
     jmp input2
      input2_end:
       call newline
       cmp di,si
       jg di_greater
        mov bx,si                       ; is the maximum
        add bx,1 
        jmp add_nums
       di_greater:
       mov bx,di
       add bx,1
      add_nums:
           mov ax,0
           mov l,0 
           cmp di,-1
           je not_dec_di
           add al,b[di]
           dec di                   ; di--
          not_dec_di:
           cmp si,-1            
           je not_dec_si
           add al,a[si]
           dec si                   ;           
           not_dec_si:
            add al,carry
            div d
            mov c[bx],ah
            mov carry,al
            dec bx                  ; bx -- 
           add l,si
           add l,di
           cmp l,-2
           je result        
       jne add_nums    
        result:
        cmp carry,1
        jne print_result
           mov al,carry
           mov c[bx],al
        print_result:
              cmp c[bx],-1
              je not_p 
              mov ah,2
              mov dl,c[bx]
              add dl,30h
              int 21h
              not_p:
            inc bx            
            cmp c[bx+1],-1
         jne print_result           
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