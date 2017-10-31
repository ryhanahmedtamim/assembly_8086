;12646 - Zero or One
.model small
.stack 100h
.data
a db ?
b db ?
c db ?
.code

main proc
          mov ax,@data
          mov ds,ax
          
          loop1:              
          call input_int
          mov a,al  ; a           
          call input_int
          mov b,al  ; b          
          call input_int ; c
          mov c,al          
          call newline          
          mov al,0            
          add al,c
          add al,b
          add al,a          
          cmp al,0        ;if al == 0 then print *
          jne next_check           
          mov ah,2
          mov dl,'*' 
          int 21h
          call newline 
          jmp loop1           
          next_check:          
          cmp al,3   ;if al == 3 then print *
          jne pritn_a_or_b_or_c          
          mov ah,2
          mov dl,'*'
          int 21h
          call newline 
          jmp loop1          
          pritn_a_or_b_or_c:          
          mov al,a          
          cmp al,b ; if a==b then print c           
          jne pritn_a_or_b          
          mov ah,2
          mov dl,'C'
          int 21h
          call newline 
          jmp loop1         
          pritn_a_or_b:          
          mov al,a         
          cmp al,c ; if a==c print B            
          jne pritn_a          
          mov ah,2
          mov dl,'B'
          int 21h
          call newline 
          jmp loop1          
          pritn_a:    
          mov ah,2
          mov dl,'A'
          int 21h
          call newline            
         jmp loop1                       
           mov ah,4ch
           int 21h
    
    main endp
         input_int proc 
            ; the number will be in ax
            push bx
            push cx
            push dx            
            mov cx,0  ;initially the number is positive            
            mov bx,0 ; total = 0            
            mov ah,1
            int 21h            
            cmp al,'-'
            jne make_number             
            mov cx,1 ; the number is negative             
            int 21h ; take the next digit                          
            make_number:             
                 And ax,000fh  ; make it digit             
                 push ax              
                 mov ax,10d  ;            
                 mul bx  ; ax = total *10             
                 pop bx              
                 add bx,ax                   
                 mov ah,1
                 int 21h             
                 cmp al,13d
             je end_make_number
                 cmp al,32d
             jne make_number
             
             end_make_number:             
                mov ax,bx            
                or cx,cx ; if the number is negative             
             je return_to_main                        
                neg ax 
            
             return_to_main:              
                 pop dx
                 pop cx
                 pop bx            
            ret          
            input_int endp
        

        ; the output number is in ax
        print_int proc
                
                push ax
                push dx
                push bx
                push cx                                
                ; if ax <0                
                or ax,ax
                jge if1_end                 
                push ax                    
                    mov ah,2
                    mov dl,'-'
                    int 21h                    
                    pop ax                    
                    neg ax                
                if1_end:                 
                ; cout the number of digit                
                    mov cx,0
                    mov bx,10d                                
                count_digit:                  
                    mov dx,0                  
                    div bx                  
                    push dx                  
                    inc cx                  
                    or ax,ax   ;                   
                jne count_digit                                     
                    mov ah,2
                 print_digit:                    
                    pop dx 
                    add dx,30h
                    int 21h                                                          
                 loop print_digit                              
                     pop cx
                     pop bx
                     pop dx
                     pop ax                                           
             ret
            print_int endp 
        
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