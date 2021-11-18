include C:\Masm614\include\console.inc
.data


    X db 100 dup (0)
    m dw 254
    n db 0
.code

Outmass proc

   push ecx
   mov ecx,0
   mov cl,n
   
    newline 
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

Leftrun proc


push eax
push ebx
push ecx
push edx

   mov edx,0
   mov dl,n
   dec edx
   
   mov ecx,0
   mov ebx,ecx
   mov al,X[ecx]
L1:
   cmp edx,ebx
   je L1end
   
   cmp edx,0
   inc ebx
   
   mov ah,X[ebx]
   cmp al,ah   
   jb L1a
   
   mov X[ecx],ah
   mov X[ebx],al
   mov cl,bl
   
   ;call Outmass  
   jmp L1 
   
L1a:   
   inc ebp
   mov al,ah
   mov cl,bl
   ;call Outmass   
   jmp L1
   
L1end:   
    ;call Outmass

pop edx
pop ebx
pop ebx
pop eax
    ret
    
Leftrun endp

Ritrun proc


push eax
push ebx
push ecx
push edx

   mov ecx,0
   mov ebx,0
   
   mov cl,n
   dec ecx
   mov edx,0
   mov ebx,ecx
   mov al,X[ecx]
   
L1:
   cmp edx,ebx
   je L1end
   
   cmp edx,0
   dec ebx
   
   mov ah,X[ebx]
   cmp al,ah   
   ja L1a
   
   mov X[ecx],ah
   mov X[ebx],al
   mov cl,bl

   ;call Outmass  
   jmp L1 
   
L1a:
   inc ebp   
   mov al,ah
   mov cl,bl
   ;call Outmass   
   jmp L1
   
L1end:   
    ;call Outmass

pop edx
pop ebx
pop ebx
pop eax
    ret
    
Ritrun endp

start:


   
   mov ecx,0
   inint n,'   vvedite chislo el massiva='
   mov bh,n
   outwordln bh,,'bh='    

;------------------------------------------

   fullmass:
   mov eax,0
   inint al
   mov X[ecx],al
   inc ecx  
   cmp bh,cl
   jne fullmass
   
   newline
   
   call Outmass 
     
cirkleall:
   
   mov edx,0
   mov dl,n
   sub dl,2
   mov ebp,0
   
   call Leftrun
   cmp ebp,edx
   je ENPPP
   mov ebp,0
   
   call Ritrun  
   cmp ebp,edx
   je ENPPP
   jmp cirkleall 
      
ENPPP: 

   newline
   outstrln ' END '        
 
    call Outmass       

  
   exit
end start