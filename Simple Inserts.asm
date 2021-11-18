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

   
   fullmass:

   outword ecx,,' ' 
   inint X[ecx],' element='   
   inc ecx  
   cmp bh,cl
   jne fullmass

   outstrln '   '
call Outmass


dec bh     
mov ecx,0

jmp L0
L4:   
   
   inc ecx

L0:   
   mov al,X[ecx]
   mov esi,ecx
   
L1:  
   inc esi
   mov ah,X[esi]

   cmp al,ah
   jb L1

   mov esi,ecx      
L2:     

   dec esi
   mov ah,X[esi]   
   cmp al,ah
   jb L2

L3: 
  
   inc esi
   mov edx,0
   mov ah,X[esi] 
   mov byte ptr [X+esi],al
   mov al,ah
   cmp ecx,esi
   jne L3

 call Outmass   
   cmp bh,cl
   jne L4
   
   outstrln '   ' 
   outstrln ' END '        
 call Outmass    

    
         
   exit
end start

