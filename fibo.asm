include 'emu8086.inc'

datos segment
    
    salva1 dw ?
    salva2 dw ?
    unidad db ?
    u1 db ?
    u2 db ?
    u3 db ?
    u4 db ?
    u5 db ?
    

 
    x db 2
    y db 2
datos ends

pila segment
    db 64 dup(0)
pila ends

codigo segment
    main proc far
        assume ss:pila,ds:datos,cs:codigo
        
        push ds
        mov ax,0
        push ax
        
        mov ax,datos
        mov ds,ax
        mov es,ax  
        
        call clear_screen
        gotoxy x,y
        
        
        call pthis
        db "Introduzca un numero: ",0
          
          
        ;------------------------
        
         mov ah,01h
         int 21h
         sub al,30h
         mov dl,al
         mov al,0      
         
         entrada:
         
         mov ah,01h
         int 21h
         cmp al,013
         je goto
         
         mov ah,0
         mov bl,10
         mov bh,al
         sub bh,30h
         mov al,dl
         mul bl
         mov bl,0
         add al,bh
         mov dl,al
         mov ax,0
         mov bx,0
         
         jmp entrada
         
        
        goto:
        mov u1,dl      
         mov y,4
        gotoxy x,y
        
        mov ah,02h
        mov dl,'0'
        int 21h
        mov ah,02h
        mov dl,'0'
        int 21h
        mov ah,02h
        mov dl,' '
        int 21h 
        
       
                 
                 
                 
        mov ah,0
        mov al,bl
        mov ch,0
        mov cl,u1
        dec cl
        xor dx,dx
        mov dx,0h 
        mov bx,01h 
        
        ciclo:
            
            mov salva1,bx
            add bx,dx
            mov salva2,bx 
            cmp bx,2AC2h
            jge special_print2
            cmp bx,1000d
            jg special_print1
            cmp bx,179h
            jge special_print
            cmp bx,144d
            jge imprimir_3_digitos
            jmp imprimir_2_digitos 
            
            salto:
            
                        
        loop ciclo
        
                
              jmp game_over
                 
              
              imprimir_2_digitos:
              mov ax,bx
              aam
              mov bx,ax
              add bx,3030h
                 
              mov ah,02h 
              mov dl,bh
              int 21h 
              
              mov ah,02h 
              mov dl,bl
              int 21h 
              
              mov ah,02h
              mov dl,' '
              int 21h 
              
              mov bx,salva2
            mov dx,salva1           
                          
              jmp salto   
              
              
              imprimir_3_digitos:
              
              mov ax,bx
              aam           
              add al,30h
              mov unidad,al
              
              mov al,ah
              mov ah,0
              
              aam
              
              mov bx,ax
              add bx,3030h
                             
              mov ah,02h 
              mov dl,bh
              int 21h 
              
              mov ah,02h 
              mov dl,bl
              int 21h  
              
              mov ah,02h
              mov dl,unidad
              int 21h
              
              mov ah,02h
              mov dl,' '
              int 21h 
              
              mov bx,salva2
            mov dx,salva1 
              
              jmp salto
              
              special_print:
              xor dx,dx
              mov ax,bx
              mov bx,10
              div bx
              mov u3,dl
              xor dx,dx
              div bx
              mov u2,dl
              xor dx,dx
              div bx
              mov u1,dl  
              xor dx,dx
              xor ax,ax
              
              mov al,u1
              add al,30h
              mov ah,02h
              mov dl,al
              int 21h
              mov al,u2
              add al,30h
              mov ah,02h
              mov dl,al
              int 21h
              mov al,u3
              add al,30h
              mov ah,02h
              mov dl,al
              int 21h
              
              mov ah,02h
              mov dl,' '
              int 21h
              
              mov bx,salva2
            mov dx,salva1
              
              jmp salto
              
              
              
              
              special_print1:
              xor dx,dx              
              mov ax,bx
              mov bx,10
              div bx
              mov u4,dl
              xor dx,dx
              div bx
              mov u3,dl
              xor dx,dx
              div bx
              mov u2,dl
              xor dx,dx
              div bx
              mov u1,dl
              xor dx,dx
              xor ax,ax
              
              mov al,u1
              add al,30h
              mov ah,02h
              mov dl,al
              int 21h
              mov al,u2
              add al,30h
              mov ah,02h
              mov dl,al
              int 21h
              mov al,u3
              add al,30h
              mov ah,02h
              mov dl,al
              int 21h
              mov al,u4
              add al,30h
              mov ah,02h
              mov dl,al
              int 21h
              
              mov ah,02h
              mov dl,' '
              int 21h  
              
              mov bx,salva2
            mov dx,salva1
              
              jmp salto
            
              special_print2:
              
              xor dx,dx              
              mov ax,bx
              mov bx,10
              div bx
              mov u5,dl
              xor dx,dx
              div bx
              mov u4,dl
              xor dx,dx
              div bx
              mov u3,dl
              xor dx,dx
              div bx
              mov u2,dl
              xor dx,dx
              div bx
              mov u1,dl
              xor dx,dx
              xor ax,ax
              
              mov al,u1
              add al,30h
              mov ah,02h
              mov dl,al
              int 21h
              mov al,u2
              add al,30h
              mov ah,02h
              mov dl,al
              int 21h
              mov al,u3
              add al,30h
              mov ah,02h
              mov dl,al
              int 21h
              mov al,u4
              add al,30h
              mov ah,02h
              mov dl,al
              int 21h
              mov al,u5
              add al,30h
              mov ah,02h
              mov dl,al
              int 21h
              
              mov ah,02h
              mov dl,' '
              int 21h  
              
              mov bx,salva2
            mov dx,salva1
              
              jmp salto
        
        
                              
              game_over:       
              mov ah,4ch
              int 21h       
            
                  
       
        
        


ret       

main endp
    codigo ends

define_pthis 
define_print_num
define_print_num_uns   
define_clear_screen

end main



