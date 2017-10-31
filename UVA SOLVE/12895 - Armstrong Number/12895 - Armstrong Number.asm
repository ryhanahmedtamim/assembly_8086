;12895 - Armstrong Number
.model small
.stack 100h
.data
p dw ?
t dw ?
n dw ?
n2 dw ?
d dw 10
m dw ?
Ar db 'Armstrong$'
not_ar db 'Not Armstrong$'
.code
main proc
          
      mov ax,@data
      mov ds,ax
      call input_int
      mov t,ax
      call newline
      ;p is number of digit
      loop1:
        mov n2,0 ; n2 = 0
        call input_int
        mov n,ax
        loop2:
           mov dx,0
           div d
           push ax
           mov m,dx
           mov ax,1
           mov bx,0
           loop3:
             mul m ; ax*=m  
             inc bx ; bx++
             cmp bx,p
            jne loop3
            add n2,ax ;n2+=ax
            pop ax 
           cmp ax,0
        jne loop2
        
        call newline 
        
        mov ah,9
        
        mov bx,n2
        cmp bx,n
        jne ar_not
        lea dx,Ar
        int 21h
        jmp continue
        ar_not:
        lea dx,not_ar
        int 21h  
        continue:
        call newline
        dec t
        cmp t,0
      jne loop1
         
      exit:
      mov ah,4ch
      int 21h
    
    main endp

         input_int proc
            mov p,0 
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
                 inc p ; p++             
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