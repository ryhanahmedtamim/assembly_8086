;12577 - Hajj-e-Akbar

.model small
.stack 100h
.data

hajj db '  Hajj-e-Akbar$'
umrah db ' Hajj-e-Asghar$'
case db 'Case $'

.code

main proc 
    
    mov ax,@data
    mov ds,ax
      
    mov bh,49  
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
        
        mov ah,2
        mov dl,bh
        int 21h
        inc bh    ; bh++
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
        
end main