include C:\Masm614\include\console.inc
.data


    X db 100 dup (0)
    m dw 254
    a db 0
    b db 0
    n db 0
.code

Outmass proc

   push ecx
   mov ecx,0
   mov cl,n
   
   outstrln '   ' 
   outstrln '-----MASSIV---- ' 
    
   printmass: 
   dec ecx
   outword ecx,,'X' 
   outwordln X[ecx],,'='
   cmp ecx,0      
   jne printmass   
   pop ecx
   ret
       
Outmass endp

start:


   mov ecx,0
   inint n,'   vvedite chislo el massiva='
   mov bh,n
;Vvod elementov massiva   
   fullmass:
   outword ecx,,' ' 
   inint X[ecx],' element='   
   inc ecx  
   cmp bh,cl
   jne fullmass
   outstrln '   '   
   mov bl,bh  ;pomeshaem v registr znachenie n-1
   dec bl
 
L6:
L5:
   cmp dl,bl ;smotrim schetchik = n-1
   je L7

   call Outmass  
   mov ecx,0
L2:
   mov edx,0   
L1: 
   cmp cl,bl  ;esli mi vkonche massiva
   je L6
   
   mov al,X[ecx]  ;sravnenie j-go i j+1-go elementa
   inc ecx
   cmp cl,bh
   je L5
   inc edx

   mov ah,X[ecx]

   cmp al,ah
   jb L1
 
   cmp dl,bl
   je L3
   
   mov byte ptr [X+ecx],al  ;meniaem mestami
   dec ecx
   mov byte ptr [X+ecx],ah
   jmp L2
        
L3:
L7:
   outstrln '   ' 
   outstrln ' END '        
 call Outmass    
         
   exit
end start

