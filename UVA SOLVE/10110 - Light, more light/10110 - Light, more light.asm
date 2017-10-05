;10110 - Light, more light

.model small
.stack 100h
.data
yes db 'yes$'
no db 'no$'
n db ?

.code

main proc
    
    
    
    MOV AX,@DATA
    MOV DS,AX     ; INITILIZE THE DATA SEGMENT 
    
    loop1:
    
    mov n,1 
    
    mov ah,1
    int 21h     ; for input
    
    and bx,0    ; bx = 0
    
    mov bl,al
    
    sub bl,48  ; bl-=48
    
    cmp bl,0    ; if the input is 0 then it will termite the program
    je exit
   
   
   call newline
    
    ; cecking it is square or not
       loop2:
   
        and ax,0  ; ax = 0
        mov al,n  ; ax = n
        
        mul n   ; ax *= n
        
        
        
        cmp al,bl
        je print_yes
        jg print_no 
        
        inc n  ; n++
   
       jmp loop2 
    
        print_yes:
        
        mov ah,9
        lea dx,yes
        int 21h
        call newline
        
        jmp loop1
    
        print_no:
        mov ah,9
        lea dx,no
        int 21h
        call newline
        
        
        
    
    jmp loop1
    
    
    
    
    Exit:
    mov ah,4ch
    int 21h
    
    main endp

        newline proc
        
        push ax
        push dx
        
        mov ah,2
        mov dl,0dh
        int 21h         ; newline
        mov dl,0ah
        int 21h
        
        pop dx
        pop ax
        
        ret
        newline endp
       
    



end main  

