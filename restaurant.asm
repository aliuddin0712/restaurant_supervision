Include Irvine32.inc
lunch proto 
breakfast proto
FastFood proto
Drinkssalad proto
Dessert proto
.data
     bill DWORD 0
	message BYTE '                     ***------------WELCOME TO ALI'S RESTAURANT-------------***',0dh,0ah,0
     message1 BYTE '                              *****MENU LIST***** ',0dh,0ah
			  BYTE '                                                            ',0dh,0ah
			  BYTE '                                                            ',0dh,0ah
             BYTE '                                  *   1. BREAK FAST        *',0dh,0ah
             BYTE '                                  *   2. LUNCH             *',0dh,0ah
             BYTE '                                  *   3. DINNER            *',0dh,0ah
             BYTE '                                  *   4. DRINKS and SALADS *',0dh,0ah
             BYTE '                                  *   5. DESSERTS          *',0dh,0ah
             BYTE '                                  *   6. EXIT              *',0dh,0ah,0


    message2  BYTE '       1. WANT MORE FOODD? ',0dh,0ah
             BYTE '       2. CREATE BILL ',0dh,0ah,0

    message3  BYTE '                *  1. Rogni Naan   = Rs 30 *',0dh,0ah
             BYTE '                *  2. chapati   = Rs 10    *',0dh,0ah
             BYTE '                *  3. Exit                 *',0dh,0ah,0

    arr3 DWORD 30,10

    message4  BYTE '                *  1. Chicken Biryani  = Rs 170 per plate  *',0dh,0ah
             BYTE '                *  2. chicken karahi   = Rs 180 per plate  *',0dh,0ah
             BYTE '                *  3. Chicken Korma    = Rs 210 per plate  *',0dh,0ah
             BYTE '                *  4. Chicken Pulao    = Rs 140 per plate  *',0dh,0ah
             BYTE '                *  5. Exit                                 *',0dh,0ah,0

    arr4 DWORD 170,180,210,140

    message5  BYTE '              1. Paratha            = Rs 30',0dh,0ah
             BYTE '              2. Chai               = Rs 40',0dh,0ah
             BYTE '              3. Halwa Poori        = Rs 35',0dh,0ah
             BYTE '              4. Fried Egg          = Rs 35',0dh,0ah
             BYTE '              5.Exit                                              *',0dh,0ah,0

   arr5 DWORD 30,40,35,35

   message6  BYTE  '                *  1. Zinger Burger    = Rs 250  *',0dh,0ah
             BYTE '                *  2. Chicken Broast   = Rs 270  *',0dh,0ah
             BYTE '                *  3. Chicken Burger   = Rs 150  *',0dh,0ah
             BYTE '                *  4. Club Sandwich    = Rs 170  *',0dh,0ah
             BYTE '                *  5. Exit                       *',0dh,0ah,0
    

    arr6 DWORD 250,270,150,170

    message7  BYTE '                *  1. Pepsi         = Rs 70 (500 ml)  *',0dh,0ah
             BYTE '                *  2. Sprite        = Rs 70 (500 ml)  *',0dh,0ah
             BYTE '                *  3. Dew           = Rs 70 (500 ml)  *',0dh,0ah
             BYTE '                *  4. Salad         = Rs 60           *',0dh,0ah
             BYTE '                *  5. Exit                            *',0dh,0ah,0

    arr7 DWORD 70,70,70,30

    message8  BYTE '               *  1. Choclate Cake            = Rs 155  *',0dh,0ah
             BYTE '               *  2. Gulaab Jaamun            = Rs 145  *',0dh,0ah
             BYTE '               *  3. kheer                    = Rs 75   *',0dh,0ah
             BYTE '               *  4. Ice-cream (All Flavours) = Rs 100   *',0dh,0ah
             BYTE '               *  5. Exit                        *',0dh,0ah,0

    arr8 DWORD 155,145,75,60
    choice byte "Enter your choice: ",0
    spaces BYTE '              ',0

    errorMsg BYTE '      Please follow instructions correctly ',0dh,0ah,0

    Quantity BYTE '      Quantity:     ',0

    billing BYTE  '        Total Bill: Rs ',0 

buff BYTE  "             ENTER NAME: ",0
order byte "             ENTER ORDER NO: ",0
buff1 byte "	Name: ",0
order1 byte "	Order NO: ",0
arr BYTE 50 dup(?)
arr1 byte 50 dup(?)
bufSize DWORD ($-arr)
  

.code
main proc

     call Crlf
     call Crlf
     
	 mov eax,red+(white*16)
call settextcolor
call clrscr
	mov edx,OFFSET message
     call Writestring
	 call crlf
	 call crlf
	 mov edx,offset order
	call writestring
	mov edx,offset arr1
	mov ecx,lengthof arr1
	call readstring

	 mov edx,offset buff
	 call writestring
	 mov edx,offset arr
	mov ecx,lengthof arr
	call readstring



     L1:  
		call crlf
	   call crlf                       
       mov edx,OFFSET message1
       call Writestring
	   call crlf
	   call crlf
       mov edx,OFFSET spaces
       call Writestring
	   mov edx,offset choice
	   call writestring
       call ReadDec
	   mov edx,OFFSET spaces
       call Writestring
	   call crlf
       call Checkerror    

       cmp eax,1      
       je L3
       cmp eax,2
       je L2
       cmp eax,3
       je L4
       cmp eax,4
       je L5
       cmp eax,5
       je L6
       jmp last

     L2: INVOKE lunch       
         jmp L7
     L3: INVOKE breakfast
         jmp L7
     L4: INVOKE FastFood
         jmp L7
     L5: INVOKE Drinkssalad
         jmp L7
     L6: INVOKE Dessert
     L7: mov edx,OFFSET message2
         call Writestring
         mov edx,OFFSET spaces
         call Writestring
         call ReadDec
         call Checkerror1
         cmp eax,1           ; if user want to continue then jump to L1
         je L1
     last:                    
         call Crlf
		 call crlf
		 mov edx,offset order1
		 call writestring
		 mov edx,offset arr1
		 call writestring
		 call crlf
		 call crlf

		 mov edx,offset buff1
		 call writestring
		 mov edx,offset arr
		 call writestring
         call Crlf
		 call crlf
         mov edx,OFFSET billing
         call Writestring
         mov eax,bill        
         call WriteDec       ; prints the bill
         call Crlf   ; next line
         call Crlf
         call WaitMsg

	invoke ExitProcess,0
main endp


lunch PROC

         mov edx,OFFSET message4
         call Writestring
         mov edx,OFFSET spaces
         call Writestring
		 mov edx,offset choice
	   call writestring
         call ReadDec
		 call Crlf
         call Crlf
		 mov edx,OFFSET spaces
       call Writestring
	   call crlf
         call Checkerror3
         cmp eax,1
         je L1
         cmp eax,2
         je L2
         cmp eax,3
         je L3
         cmp eax,4
         je L4
         cmp eax,5
         jmp last
 L1: mov edx,OFFSET Quantity
     call Writestring
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[arr4]      ; arr4 is array contains price of oriental foods
     L11:                   ; quantity times a loop L11 runs           
        add bill,ebx            ; add price into bill
        loop L11
     jmp last
 L2: mov edx,OFFSET Quantity
     call Writestring
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[arr4 + 4]
     L22:
         add bill,ebx
         loop L22
     call M1
     jmp last
 L3: mov edx,OFFSET Quantity
     call Writestring
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[arr4 + 8]
     L33:
         add bill,ebx
         loop L33
     call M1
     jmp last
 L4: mov edx,OFFSET Quantity
     call Writestring
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[arr4 + 12]
     L44:
         add bill,ebx
         loop L44
     call M1
last:
ret
lunch ENDP

M1 PROC

        mov edx,OFFSET message3
        call Writestring
        mov edx,OFFSET spaces
        call Writestring
        call ReadDec
		mov edx,offset choice
	   call writestring
        call Checkerror2
        cmp eax,1
        je L1
        cmp eax,2
        je L2
        jmp last
     L1:
        mov ebx,[arr3]    ; buuffer3 is array contains price of Naan 
        mov edx,OFFSET Quantity
        call Writestring
        call ReadDec
        call Crlf
        mov ecx,eax
        L11:
          add bill,ebx
          loop L11
       jmp last
     L2:
        mov ebx,[arr3 + 4]
        mov edx,OFFSET Quantity
        call Writestring
        call ReadDec
        call Crlf
        mov ecx,eax
        L22:
          add bill,ebx
          loop L22
last:
ret
M1 ENDP


breakfast PROC

         mov edx,OFFSET message5
         call Writestring
         mov edx,OFFSET spaces
         call Writestring
		 mov edx,offset choice
	   call writestring
         call ReadDec
         call Crlf
		  mov edx,OFFSET spaces
         call Writestring
		 call crlf
         call Checkerror3       ; check for error
         cmp eax,1
         je L1
         cmp eax,2
         je L2
         cmp eax,3
         je L3
         cmp eax,4
         je L4
         cmp eax,5
         jmp last

 L1: mov edx,OFFSET Quantity
     call Writestring
     call ReadDec
     mov ecx,eax
     mov ebx,[arr5]   
     L11:
        add bill,ebx
        loop L11
     jmp last
 L2: mov edx,OFFSET Quantity
     call Writestring
     call ReadDec
     mov ecx,eax
     mov ebx,[arr5 + 4]
     L22:
         add bill,ebx
         loop L22
     jmp last
 L3: mov edx,OFFSET Quantity
     call Writestring
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[arr5 + 8]
     L33:
         add bill,ebx
         loop L33
     jmp last
 L4: mov edx,OFFSET Quantity
     call Writestring
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[arr5 + 12]
     L44:
         add bill,ebx
         loop L44
last:

ret
breakfast ENDP
         
FastFood PROC

         mov edx,OFFSET message6
         call Writestring
         mov edx,OFFSET spaces
         call Writestring
		 mov edx,offset choice
	   call writestring
         call ReadDec
		 call Crlf
         call Crlf
		 mov edx,OFFSET spaces
       call Writestring
	   call crlf
         call Checkerror3
         cmp eax,1
         je L1
         cmp eax,2
         je L2
         cmp eax,3
         je L3
         cmp eax,4
         je L4
         cmp eax,5
         jmp last
 L1: mov edx,OFFSET Quantity
     call Writestring
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[arr6]
     L11:
        add bill,ebx
        loop L11
     jmp last
 L2: mov edx,OFFSET Quantity
     call Writestring
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[arr6 + 4]
     L22:
         add bill,ebx
         loop L22
     jmp last
 L3: mov edx,OFFSET Quantity
     call Writestring
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[arr6 + 8]
     L33:
         add bill,ebx
         loop L33
     jmp last
 L4: mov edx,OFFSET Quantity
     call Writestring
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[arr6 + 12]
     L44:
         add bill,ebx
         loop L44
last:
ret
FastFood ENDP
         
Drinkssalad PROC

         mov edx,OFFSET message7
         call Writestring
         mov edx,OFFSET spaces
         call Writestring
		 mov edx,offset choice
	   call writestring
         call ReadDec
		 call Crlf
         call Crlf
		 mov edx,OFFSET spaces
       call Writestring
	   call crlf
         call Checkerror3
         cmp eax,1
         je L1
         cmp eax,2
         je L2
         cmp eax,3
         je L3
         cmp eax,4
         je L4
         cmp eax,5
         jmp last
 L1: mov edx,OFFSET Quantity
     call Writestring
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[arr7]
     L11:
        add bill,ebx
        loop L11
     jmp last
 L2: mov edx,OFFSET Quantity
     call Writestring
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[arr7 + 4]
     L22:
         add bill,ebx
         loop L22
     jmp last
 L3: mov edx,OFFSET Quantity
     call Writestring
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[arr7 + 8]
     L33:
         add bill,ebx
         loop L33
     jmp last
 L4: mov edx,OFFSET Quantity
     call Writestring
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[arr7 + 12]
     L44:
         add bill,ebx
         loop L44
last:
ret
Drinkssalad ENDP
         
Dessert PROC

         mov edx,OFFSET message8
         call Writestring
         mov edx,OFFSET spaces
         call Writestring
         call ReadDec
		 call Crlf
         call Crlf
		 mov edx,OFFSET spaces
       call Writestring
	   call crlf
         call Checkerror3
         cmp eax,1
         je L1
         cmp eax,2
         je L2
         cmp eax,3
         je L3
         cmp eax,4
         je L4
         cmp eax,5
         jmp last
 L1: mov edx,OFFSET Quantity
     call Writestring
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[arr8]
     L11:
        add bill,ebx
        loop L11
     jmp last
 L2: mov edx,OFFSET Quantity
     call Writestring
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[arr8 + 4]
     L22:
         add bill,ebx
         loop L22
     jmp last
 L3: mov edx,OFFSET Quantity
     call Writestring
     call ReadDec
     mov ecx,eax
     call Crlf
     mov ebx,[arr8 + 8]
     L33:
         add bill,ebx
         loop L33
     jmp last
 L4: mov edx,OFFSET Quantity
     call Writestring
     call ReadDec
     call Crlf
     mov ecx,eax
     mov ebx,[arr8 + 12]
     L44:
         add bill,ebx
         loop L44

last:
ret
Dessert ENDP

Checkerror PROC

L1:
   cmp eax,1
   jl L2
   cmp eax,6
   jg L2
   jmp last

L2:
   mov edx, OFFSET errorMsg
   call Writestring
   call ReadDec
   jmp L1
last:
ret
Checkerror ENDP

Checkerror1 PROC

L1:
   cmp eax,1
   jl L2
   cmp eax,2
   jg L2
   jmp last

L2:
   mov edx, OFFSET errorMsg
   call Writestring
   call ReadDec
   jmp L1
last:
ret
Checkerror1 ENDP

Checkerror2 PROC

L1:
   cmp eax,1
   jl L2
   cmp eax,3
   jg L2
   jmp last

L2:
   mov edx, OFFSET errorMsg
   call Writestring
   call ReadDec
   jmp L1
last:
ret
Checkerror2 ENDP

Checkerror3 PROC

L1:
   cmp eax,1
   jl L2
   cmp eax,5
   jg L2
   jmp last

L2:
   mov edx, OFFSET errorMsg
   call Writestring
   call ReadDec
   jmp L1
last:
ret
Checkerror3 ENDP

end main
