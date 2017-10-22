.model small
.stack 100h
.data
 a db 1,2,3,5,6,7
   db 5,5,6,8,8,4
   db 9,3,5,5,6,7
   
r db 3
c db 5
   
.code

main proc
    
    
    mov ax,@data
    mov ds,ax
    
     
     
     mov bx,0
     
     
     
    
    loop_out:
            mov si,0  
            mov c,6
             loop_inner:
            mov ah,2
            mov dl,a[bx][si]
            
            add dl,30h
            
            int 21h 
            
            mov dl,' '
            int 21h
            
            inc si
            dec c
            cmp c,0
            jne loop_inner
            add bx,si
            
            dec r
            
            mov dl,0ah
            int 21h
            mov dl,0dh
            int 21h
            
            cmp r,0
            jne loop_out
    
     