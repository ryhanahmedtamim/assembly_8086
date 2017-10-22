.model small
.stack 100h
.data

a db 100 dup(?)

.code

main proc 
    
    mov ax,@data
    mov ds,ax
    
    mov cx,0 
    
 ;   mov ah,1
    
    mov si,0
    
    
    mov ah,1 
    int 21h
    
    loop1:
    
    inc cx
    mov a[si],al
    
    inc si
    
    int 21h
    
    cmp al,13
    jne loop1
    
    
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
    mov si,0
    
    
    print:
    mov dl,a[si]
    ;add dl,30h
    int 21h
    mov dl,' '
    int 21h
    
    add si,1
    
    loop print
    
    
    
    
    
    