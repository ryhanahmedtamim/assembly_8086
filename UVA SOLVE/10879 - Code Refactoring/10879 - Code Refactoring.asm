;10879 - Code Refactoring
.model small
.stack 100h
.data
a dw 4 dup(-1)
n dw ?
case db 'Case $'
casenumber dw 1
t dw ?
n2 dw 2
i dw ?
.code
main proc
     mov ax,@data
     mov ds,ax
     call input_int
     mov t,ax
     call newline 
     loop1:
         call input_int
         mov n,ax
         call newline
         and dx,0
         div n2
         mov si,0
         mov bx,ax ; bx = n/2
         mov i,2   ; i = 0       
         loop2:
              and dx,0
              mov ax,n
              div i
              inc i ; i++
              cmp dx,0 
              jne loop2
              mov a[si],ax
              mov ax,i
              dec ax ; ax --
              mov a[si+2],ax
              add si,4
              cmp si,8
              je print_result
              
          cmp i,bx
          jl loop2    
         print_result:
         mov si,0
         mov ah,9
         lea dx,case
         int 21h
         mov ah,2
         mov dl,'#'
         int 21h
         mov ax,casenumber
         call print_int
         mov ah,2
         mov dl,':'
         int 21h
         mov ah,2
         mov dl,' '
         int 21h
         mov ax,n
         call print_int
         mov ah,2
         mov dl,' '
         int 21h
         mov dl,'='
         int 21h
         mov dl,' '
         int 21h
         mov ax,a[si]
         call print_int
         mov ah,2
         mov dl,' '
         int 21h
         mov dl,'*'
         int 21h
         mov dl,' '
         int 21h
         int 21h
         mov ax,a[si+2]
         call print_int
         mov ah,2
         mov dl,' '
         int 21h
         mov dl,'='
         int 21h
         mov dl,' '
         int 21h
         mov ax,a[si+4]
         call print_int
         mov ah,2
         mov dl,' '
         int 21h
         mov dl,'*'
         int 21h
         mov dl,' '
         int 21h
         mov ax,a[si+6]
         call print_int
         call newline                 
         inc casenumber ; casenumber++
         mov ax,t
         cmp casenumber,ax
     jng loop1      
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