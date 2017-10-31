;12577 - Hajj-e-Akbar
.model small
.stack 100h
.data
hajj db '  Hajj-e-Akbar$'
umrah db ' Hajj-e-Asghar$'
case db 'Case $'
t dw 1
.code

main proc 
    
    mov ax,@data
    mov ds,ax
       
      loop1:
        mov ah,1
        int 21h        
        mov bl,al
        loop2:
        int 21h
        cmp al,13d     
        je if_1         
        jmp loop2
        if_1:
        cmp bl,'*'  ; if bl == '*' then break
        je exit                
        call newline
        ;print case
        mov ah,9
        lea dx,case
        int 21h      
        ; print case number
        mov ax,t
        call print_int         
        mov ah,2
        inc t    ; bh++
        mov dl,':'
        int 21h
        
        cmp bl,'H' ; if bl == 'H' 
        jne hajj_umrah        
        mov ah,9
        lea dx,hajj
        int 21h
        call newline        
        jmp loop1 ; continue loop1
        hajj_umrah:        
        mov ah,9
        lea dx,umrah
        int 21h
        call newline     
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
        
end main