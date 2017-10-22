;10079 - Pizza Cutting
.model small
.stack 100h

.code

main proc
          
          
      
          
          loop1:
          call input_int ; n
          
          mov bx,ax
          
          or bx,bx
          jl exit
          
          mov bx,ax
          
          inc bx ; bx++ ; n+1
          
          and dx,0
          
          mul bx  ;   n(n+1)
          
          mov bl,2
          
          div bl ; n(n+1)/2
          
          inc ax ; (n(n+1)/2)+1
          
          
          call newline
          call print_int
          call newline 
         
         jmp loop1 
           
           
           
           
           exit:
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