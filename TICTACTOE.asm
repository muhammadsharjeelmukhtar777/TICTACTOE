[org 0x0100]
;player 1--------------------O
;player 2--------------------X
jmp start
message1: dw 'WELCOME_TO_TIC_TAC_TOE_GAME'
length01: dw 27
message2: dw 'PRESS_ANY_KEY_TO_CONTINUE'
length02: dw 25
message3:dw'O for player 1' 
length03:dw 14
message4:dw'X for player 2' 
length04:dw 14
turn:dw 2
place: dw 0
input_key:dw 0
REPEAT:dw 0
over: dw 0				;if player 1 win then 1 if 2 wins then 2 else 0
m5:dw 'GAME_OVER_PLAYER_ONE_WON'
m6:dw 'GAME_OVER_PLAYER_TWO_WON'
m7:dw 'GAME_OVER_ITS_A_DRAW'
length5:dw 24
length6:dw 24
length7:dw 20
OUTPUT:
	pusha
	mov di,word[place]		
	mov ax,0xb800
	mov es,ax
        mov ah,0x0F				
	cmp word[turn],1
	jne if_2
	mov al,"O"
	jmp placement

if_2:	

	mov al,"X"

placement:
	mov word[es:di],ax		
	popa
	ret


;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;
;/////INPUT
;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;
INPUT:
key:
        mov ah,00
	int 16h
check0:
	cmp al,48	;code for 0
	jne check1
	mov word[input_key],0
	jmp END
check1
	cmp al,49		;code for 1
	jne check2
	mov word[input_key],1
	jmp END

check2:
	cmp al,50		;code for 2
	jne check3
	mov word[input_key],2
	jmp END

check3:
	cmp al,51		;code for 3
	jne check4
	mov word[input_key],3
	jmp END

check4:
	cmp al,52	;4
	jne check5
	mov word[input_key],4
	jmp END


check5:
	cmp al,53		;5
	jne check6
	mov word[input_key],5
	jmp END

check6:
	cmp al,54		;6
	jne check7
	mov word[input_key],6
	jmp END

check7:
	cmp al,55		;7
	jne check8
	mov word[input_key],7
	jmp END

check8:
	cmp al,56		;8
	jne check9
	mov word[input_key],8
	jmp END

check9:
	cmp al,57		;9
	jne moveA
	mov word[input_key],9
	jmp END


moveA:
	cmp al,97		;A
	jne moveB
	mov word[input_key],10
	jmp END

moveB:
	cmp al,98		;B
	jne moveC
	mov word[input_key],11
	jmp END

moveC:
	cmp al,99		;C
	jne moveD
	mov word[input_key],12
	jmp END

moveD:
	cmp al,100	;D
	jne moveE
	mov word[input_key],13
	jmp END
moveE:
cmp al,101	;E
	jne moveF
	mov word[input_key],14
	jmp END
moveF:
cmp al,102	;F
	jne invalidKey
	mov word[input_key],15
	jmp END
invalidKey:
jmp key
END:
ret
;;;;;;;;;;;;;;;;;;;;;;;;;
;TURN
;;;;;;;;;;;;;;;;;;;;;;;;;
TURN:
   push ax
   mov ax, word[turn]
   cmp ax, 1
   jne TURN1
   mov word[turn], 2
   jmp done  ; Define done label
TURN1:
   mov word[turn], 1
done:  ; Define done label
   pop ax
   ret
;============================================================================================================================
;checkrow1 
;============================================================================================================================
checkrow1for1:
pusha
mov di,972
mov bx,0
mov bh,0x0F
mov bl,"O"

	cmp word[es:di],bx		
	jne  skip0
        mov word[over],1
        mov di,990
        cmp word[es:di],bx
        jne  skip0
        mov word[over],1
        mov di,1008
        cmp word[es:di],bx
        jne  skip0
        mov word[over],1
        mov di,1026
        cmp word[es:di],bx
        jne  skip0
        jmp end0
skip0:
mov word[over],0
end0:
popa
ret
;----------------------------------------------------------------------------------------------------------
checkrow1for2:
pusha
mov di,972
mov bx,0
mov bh,0x0F
mov bl,"X"

	cmp word[es:di],bx		
	jne  skip1
        mov word[over],2
        mov di,990
        cmp word[es:di],bx
        jne  skip1
        mov word[over],2
        mov di,1008
        cmp word[es:di],bx
        jne  skip1
        mov word[over],2
        mov di,1026
        cmp word[es:di],bx
        jne  skip1
        jmp end1
skip1:
mov word[over],0
end1:
popa
ret
;===================================================================================================================================
;checkrow2
;==================================================================================================================================
checkrow2for1:
pusha
mov di,1772
mov bx,0
mov bh,0x0F
mov bl,"O"

	cmp word[es:di],bx		
	jne  skip2
        mov word[over],1
        mov di,1790
        cmp word[es:di],bx
        jne  skip2
        mov word[over],1
        mov di,1808
        cmp word[es:di],bx
        jne  skip2
        mov word[over],1
        mov di,1826
        cmp word[es:di],bx
        jne  skip2
        jmp end2
skip2:
mov word[over],0
end2:
popa
ret

;------------------------------------------------------------------------------------------------------------------------------
checkrow2for2:
pusha
mov di,1772
mov bx,0
mov bh,0x0F
mov bl,"X"

	cmp word[es:di],bx		
	jne  skip3
        mov word[over],2
        mov di,1790
        cmp word[es:di],bx
        jne  skip3
        mov word[over],2
        mov di,1808
        cmp word[es:di],bx
        jne  skip3
        mov word[over],2
        mov di,1826
        cmp word[es:di],bx
        jne  skip3
        jmp end3
skip3:
mov word[over],0
end3:
popa
ret
;=====================================================================================================================================
;checkrow3
;=====================================================================================================================================
checkrow3for1:
pusha
mov di,2572
mov bx,0
mov bh,0x0F
mov bl,"O"

	cmp word[es:di],bx		
	jne  skip4
        mov word[over],1
        mov di,2590
        cmp word[es:di],bx
        jne  skip4
        mov word[over],1
        mov di,2608
        cmp word[es:di],bx
        jne  skip4
        mov word[over],1
        mov di,2626
        cmp word[es:di],bx
        jne  skip4
        jmp end4
skip4:
mov word[over],0
end4:
popa
ret
;-----------------------------------------------------------------------------------------------------------------------------------
checkrow3for2:
pusha
mov di,2572
mov bx,0
mov bh,0x0F
mov bl,"X"

	cmp word[es:di],bx		
	jne  skip5
        mov word[over],2
        mov di,2590
        cmp word[es:di],bx
        jne  skip5
        mov word[over],2
        mov di,2608
        cmp word[es:di],bx
        jne  skip5
        mov word[over],2
        mov di,2626
        cmp word[es:di],bx
        jne  skip5
        jmp end5
skip5:
mov word[over],0
end5:
popa
ret
;=====================================================================================================================================
;checkrow4
;=====================================================================================================================================
checkrow4for1:
pusha
mov di,3372
mov bx,0
mov bh,0x0F
mov bl,"O"

	cmp word[es:di],bx		
	jne  skip6
        mov word[over],1
        mov di,3390
        cmp word[es:di],bx
        jne  skip6
        mov word[over],1
        mov di,3408
        cmp word[es:di],bx
        jne  skip6
        mov word[over],1
        mov di,3426
        cmp word[es:di],bx
        jne  skip6
        jmp end6
skip6:
mov word[over],0
end6:
popa
ret
;-----------------------------------------------------------------------------------------------------------------------------------
checkrow4for2:
pusha
mov di,3372
mov bx,0
mov bh,0x0F
mov bl,"X"

	cmp word[es:di],bx		
	jne  skip7
        mov word[over],2
        mov di,3390
        cmp word[es:di],bx
        jne  skip7
        mov word[over],2
        mov di,3408
        cmp word[es:di],bx
        jne  skip7
        mov word[over],2
        mov di,3426
        cmp word[es:di],bx
        jne  skip7
        jmp end7
skip7:
mov word[over],0
end7:
popa
ret
;==========================================================================================================================
;DIAGONALS
;==========================================================================================================================
checkdiag1for1:
pusha
mov di,972
mov bx,0
mov bh,0x0F
mov bl,"O"

	cmp word[es:di],bx		
	jne  skip8
        mov word[over],1
        mov di,1790
        cmp word[es:di],bx
        jne  skip8
        mov word[over],1
        mov di,2608
        cmp word[es:di],bx
        jne  skip8
        mov word[over],1
        mov di,3426
        cmp word[es:di],bx
        jne  skip8
        jmp end8
skip8:
mov word[over],0
end8:
popa
ret
;--------------------------------------------------------------------------------------------------------------------------
checkdiag2for1:
pusha
mov di,1026
mov bx,0
mov bh,0x0F
mov bl,"O"

	cmp word[es:di],bx		
	jne  skip9
        mov word[over],1
        mov di,1808
        cmp word[es:di],bx
        jne  skip9
        mov word[over],1
        mov di,2590
        cmp word[es:di],bx
        jne  skip9
        mov word[over],1
        mov di,3372
        cmp word[es:di],bx
        jne  skip9
        jmp end9
skip9:
mov word[over],0
end9:
popa
ret
;==========================================================================================================================
checkdiag1for2:
pusha
mov di,972
mov bx,0
mov bh,0x0F
mov bl,"X"

	cmp word[es:di],bx		
	jne  skipA
        mov word[over],2
        mov di,1790
        cmp word[es:di],bx
        jne  skipA
        mov word[over],2
        mov di,2608
        cmp word[es:di],bx
        jne  skipA
        mov word[over],2
        mov di,3426
        cmp word[es:di],bx
        jne  skipA
        jmp endA
skipA:
mov word[over],0
endA:
popa
ret
;--------------------------------------------------------------------------------------------------------------------------
checkdiag2for2:
pusha
mov di,1026
mov bx,0
mov bh,0x0F
mov bl,"X"

	cmp word[es:di],bx		
	jne  skipB
        mov word[over],2
        mov di,1808
        cmp word[es:di],bx
        jne  skipB
        mov word[over],2
        mov di,2590
        cmp word[es:di],bx
        jne  skipB
        mov word[over],2
        mov di,3372
        cmp word[es:di],bx
        jne  skipB
        jmp endB
skipB:
mov word[over],0
endB:
popa
ret
;===========================================================================================================================
;checkcolumns for palyer 1
;===========================================================================================================================
checkcol1for1:
pusha
mov di,972
mov bx,0
mov bh,0x0F
mov bl,"O"

	cmp word[es:di],bx		
	jne  skipC
        mov word[over],1
        mov di,1772
        cmp word[es:di],bx
        jne  skipC
        mov word[over],1
        mov di,2572
        cmp word[es:di],bx
        jne  skipC
        mov word[over],1
        mov di,3372
        cmp word[es:di],bx
        jne  skipC
        jmp endC
skipC:
mov word[over],0
endC:
popa
ret
;======================================================================================================================
checkcol2for1:
pusha
mov di,990
mov bx,0
mov bh,0x0F
mov bl,"O"

	cmp word[es:di],bx		
	jne  skipD
        mov word[over],1
        mov di,1790
        cmp word[es:di],bx
        jne  skipD
        mov word[over],1
        mov di,2590
        cmp word[es:di],bx
        jne  skipD
        mov word[over],1
        mov di,3390
        cmp word[es:di],bx
        jne  skipD
        jmp endD
skipD:
mov word[over],0
endD:
popa
ret
;=========================================================================================================================
checkcol3for1:
pusha
mov di,1008
mov bx,0
mov bh,0x0F
mov bl,"O"

	cmp word[es:di],bx		
	jne  skipE
        mov word[over],1
        mov di,1808
        cmp word[es:di],bx
        jne  skipE
        mov word[over],1
        mov di,2608
        cmp word[es:di],bx
        jne  skipE
        mov word[over],1
        mov di,3408
        cmp word[es:di],bx
        jne  skipE
        jmp endE
skipE:
mov word[over],0
endE:
popa
ret
;=========================================================================================================================
checkcol4for1:
pusha
mov di,1026
mov bx,0
mov bh,0x0F
mov bl,"O"

	cmp word[es:di],bx		
	jne  skipF
        mov word[over],1
        mov di,1826
        cmp word[es:di],bx
        jne  skipF
        mov word[over],1
        mov di,2626
        cmp word[es:di],bx
        jne  skipF
        mov word[over],1
        mov di,3426
        cmp word[es:di],bx
        jne  skipF
        jmp endF
skipF:
mov word[over],0
endF:
popa
ret
;=============================
;===========================================================================================================================
;checkcolumns for palyer 2
;=======================================================================================================================
checkcol1for2:
pusha
mov di,972
mov bx,0
mov bh,0x0F
mov bl,"X"

	cmp word[es:di],bx		
	jne  skipG
        mov word[over],2
        mov di,1772
        cmp word[es:di],bx
        jne  skipG
        mov word[over],2
        mov di,2572
        cmp word[es:di],bx
        jne  skipG
        mov word[over],2
        mov di,3372
        cmp word[es:di],bx
        jne  skipG
        jmp endG
skipG:
mov word[over],0
endG:
popa
ret
;======================================================================================================================
checkcol2for2:
pusha
mov di,990
mov bx,0
mov bh,0x0F
mov bl,"X"

	cmp word[es:di],bx		
	jne  skipD
        mov word[over],2
        mov di,1790
        cmp word[es:di],bx
        jne  skipH
        mov word[over],2
        mov di,2590
        cmp word[es:di],bx
        jne  skipH
        mov word[over],2
        mov di,3390
        cmp word[es:di],bx
        jne  skipH
        jmp endH
skipH:
mov word[over],0
endH:
popa
ret
;=========================================================================================================================
checkcol3for2:
pusha
mov di,1008
mov bx,0
mov bh,0x0F
mov bl,"X"

	cmp word[es:di],bx		
	jne  skipI
        mov word[over],2
        mov di,1808
        cmp word[es:di],bx
        jne  skipI
        mov word[over],2
        mov di,2608
        cmp word[es:di],bx
        jne  skipI
        mov word[over],2
        mov di,3408
        cmp word[es:di],bx
        jne  skipI
        jmp endI
skipI:
mov word[over],0
endI:
popa
ret
;=========================================================================================================================
checkcol4for2:
pusha
mov di,1026
mov bx,0
mov bh,0x0F
mov bl,"X"

	cmp word[es:di],bx		
	jne  skipK
        mov word[over],2
        mov di,1826
        cmp word[es:di],bx
        jne  skipK
        mov word[over],2
        mov di,2626
        cmp word[es:di],bx
        jne  skipK
        mov word[over],2
        mov di,3426
        cmp word[es:di],bx
        jne  skipK
        jmp endK
skipK:
mov word[over],0
endK:
popa
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;----------------------------------------------------------------------------------------------------------------------------
;checkwinning condition
;----------------------------------------------------------------------------------------------------------------------------
Wincond:
jmp loop1
terminate:
ret
loop1:
;--------------------------------------------------------------------------------------------------
call  checkdiag1for1
cmp word[over],0
jne terminate
call  checkdiag2for1
cmp word[over],0
jne terminate
;--------------------------------------------------------------------------------------------------
call  checkdiag1for2
cmp word[over],0
jne terminate
call  checkdiag2for2
cmp word[over],0
jne terminate
;--------------------------------------------------------------------------------------------------
call checkcol1for1
cmp word[over],0
jne terminate
call checkcol2for1
cmp word[over],0
jne terminate
call checkcol3for1
cmp word[over],0
jne terminate
call checkcol4for1
cmp word[over],0
jne terminate
;--------------------------------------------------------------------------------------------------
call checkcol1for2
cmp word[over],0
jne terminate
call checkcol2for2
cmp word[over],0
jne terminate
call checkcol3for2
cmp word[over],0
jne terminate
call checkcol4for2
cmp word[over],0
jne terminate
;---------------------------------------------------------------------------------------------------
call checkrow1for1
cmp word[over],0
jne terminate
call checkrow2for1
cmp word[over],0
jne terminate
call checkrow3for1
cmp word[over],0
jne terminate
call checkrow4for1
cmp word[over],0
jne terminate
;-------------------------------------------------------------------------------------------------
call checkrow1for2
cmp word[over],0
jne terminate
call checkrow2for2
cmp word[over],0
jne terminate
call checkrow3for2
cmp word[over],0
jne terminate
call checkrow4for2
cmp word[over],0
jne terminate
ret
;-------------------------------------------------------------------------------------------------

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////CLRSCR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
clrscr:
    push es
    push ax
    push cx
    push di
    mov ax, 0xb800
    mov es, ax         ; point es to video base
    xor di, di         ; point di to top left column
    mov ax, 0x0720     ; space character in normal attribute
    mov cx, 2000       ; number of screen locations
    cld                ; auto increment mode
    rep stosw          ; clear the whole screen
    pop di
    pop cx
    pop ax
    pop es
    ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;//////////////////////////////////////////////////////////////////PRINTSTR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

printstr:
	push bp 
 	mov bp, sp 
	push es 
 	push ax 
 	push cx 
 	push si 
 	push di 

 	mov ax, 0xb800 
 	mov es, ax 
 	mov di, [bp+8] 		
 	mov si, [bp+6]  		
 	mov cx, [bp+4]
 	mov ah,0xF0			

checkchars1:
 	mov al, [si] 
 	mov [es:di], ax  
 	add di, 2  
 	add si, 1 
	loop checkchars1 

 	pop di 
 	pop si 
 	pop cx 
 	pop ax 
 	pop es 
 	pop bp 	
	ret 6 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////PrintMESSAGE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PrintMessages:
call clrscr
        mov ax,320;8
        push ax
	mov ax, message1;6
 	push ax
 	push word [length01] ;4
 	call printstr
        mov ax,800	
	push ax
	mov ax, message2 
 	push ax 
 	push word [length02] 
 	call printstr

	mov ah,0
	int 16h
	ret
Print_instruction:
 mov ax,1928;8
        push ax
	mov ax, message3;6
 	push ax
 	push word [length03] ;4
 	call printstr
 mov ax,2408;8
        push ax
	mov ax, message4;6
 	push ax
 	push word [length04] ;4
 	call printstr
 mov ax,2888
	push ax
	mov ax, message2
 	push ax 
 	push word [length02] 
 	call printstr

mov ah,0
	int 16h
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;///////////////////////////////////////////////////////////////////1 BOX
PrintoneBox:

	push bp
	mov bp,sp
	


mov ax,0xb800
mov es,ax

mov cx,5
mov di,word[bp+4]			;starting position (top left)

mov ax,0
mov ah,byte[bp+7]			;color
mov al,0h

l1:
	mov [es:di],ax
	add di,2
	loop l1

mov cx,5
add di,150
l2:
	mov [es:di],ax
	add di,2
	loop l2


mov cx,5
add di,150
l3:
	mov [es:di],ax
	add di,2
	loop l3




	pop bp
	ret 4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;////////////////////////////////////////////////////////////////////////////////////BOXES
;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
BOX:
        mov ah,0xE1
         mov al,0x0
push ax
	mov ax,808
	push ax
	call PrintoneBox
 mov ah,0xE1
         mov al,0x0
push ax
	mov ax,826
	push ax
	call PrintoneBox
 mov ah,0xE1
         mov al,0x0
push ax
	mov ax,844
	push ax
	call PrintoneBox
        mov ah,0xE1
         mov al,0x0
        push ax
	mov ax,862
	push ax
	call PrintoneBox
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 mov ah,0xE1
         mov al,0x0
        push ax
	mov ax,1608
	push ax
	call PrintoneBox
 mov ah,0xE1
         mov al,0x0
        push ax
	mov ax,1626
	push ax
	call PrintoneBox
 mov ah,0xE1
         mov al,0x0
        push ax
	mov ax,1644
	push ax
	call PrintoneBox

 mov ah,0xE1
         mov al,0x0
        push ax
	mov ax,1662
	push ax
	call PrintoneBox
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 mov ah,0xE1
         mov al,0x0
        push ax
	mov ax,2408
	push ax
	call PrintoneBox
 mov ah,0xE1
         mov al,0x0
        push ax
	mov ax,2426
	push ax
	call PrintoneBox
 mov ah,0xE1
         mov al,0x0
        push ax
	mov ax,2444
	push ax
	call PrintoneBox
 mov ah,0xE1
         mov al,0x0
        push ax
	mov ax,2462
	push ax
	call PrintoneBox
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 mov ah,0xE1
         mov al,0x0
        push ax
	mov ax,3208
	push ax
	call PrintoneBox
 mov ah,0xE1
         mov al,0x0
        push ax
	mov ax,3226
	push ax
	call PrintoneBox
 mov ah,0xE1
         mov al,0x0
        push ax
	mov ax,3244
	push ax
	call PrintoneBox
 mov ah,0xE1
         mov al,0x0
        push ax
	mov ax,3262
	push ax
	call PrintoneBox

ret
;-----------------------------------------------------------------------------------------------------------------------------------
;PLACE
;-----------------------------------------------------------------------------------------------------------------------------------
PLACE:
        pusha
	cmp word[input_key],0
	jne store_1
	mov di,972
	jmp check_if_1

store_1:
	cmp word[input_key],1
	jne store_2
	mov di,990
	jmp check_if_1

store_2:
	cmp word[input_key],2
	jne store_3
	mov di,1008
	jmp check_if_1

store_3:
	cmp word[input_key],3
	jne store_4
	mov di,1026
	jmp check_if_1

store_4:
	cmp word[input_key],4
	jne store_5
	mov di,1772
	jmp check_if_1

store_5:
	cmp word[input_key],5
	jne store_6
	mov di,1790
	jmp check_if_1

store_6:
	cmp word[input_key],6
	jne store_7
	mov di,1808
	jmp check_if_1

store_7:
	cmp word[input_key],7
	jne store_8
	mov di,1826
	jmp check_if_1

store_8:
	cmp word[input_key],8
	jne store_9
	mov di,2572
	jmp check_if_1

store_9:
	cmp word[input_key],9
	jne store_A
	mov di,2590
	jmp check_if_1

store_A:
	cmp word[input_key],10
	jne store_B
	mov di,2608
	jmp check_if_1

store_B:
	cmp word[input_key],11
	jne store_C
	mov di,2626
        jmp check_if_1
store_C:
	cmp word[input_key],12
	jne store_D
	mov di,3372
	jmp check_if_1

store_D:
	cmp word[input_key],13
	jne store_E
	mov di,3390
	jmp check_if_1

store_E:
	cmp word[input_key],14
	jne store_F
	mov di,3408
	jmp check_if_1

store_F:
	cmp word[input_key],15
	mov di,3426

check_if_1:
	mov ax,0xb800
	mov es,ax


mov bx,0
mov bh,0x0F
mov bl,"O"
	cmp word[es:di],bx		
	jne check_if_2
	mov word[REPEAT],1	;there is 1 in the box
	jmp BACK
check_if_2:
mov bx,0
mov bh,0x0F
mov bl,"X"

	cmp word[es:di],bx		
	jne  empty
	mov word[REPEAT],1	;there is 2 in the box
	jmp BACK
	
empty:
	mov word[REPEAT],0


BACK:
	mov word[place],di ;store place of the input 
        popa
	ret
;======================================================================================================================================
printresult:
jmp start01
draw:
mov ax,320;8
push ax
mov ax, m7;6
push ax
push word [length7] ;4
call printstr
jmp end01
p1:
mov ax,320;8
push ax
mov ax, m5;6
push ax
push word [length5] ;4
call printstr
jmp end01
p2:
mov ax,320;8
push ax
mov ax, m6;6
push ax
push word [length6] ;4
call printstr
jmp end01
start02:
cmp word[over],1
je p1
cmp word[over],2
je p2
start01:
cmp word[over],0
jne start02
cmp word[over],0
je draw
end01:
mov ax,800;8
push ax
mov ax, message2;6
push ax
push word [length02] ;4
call printstr
mov ah,0
int 16h
call clrscr
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;START
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
start:
call clrscr
call PrintMessages
call clrscr
call Print_instruction
call clrscr
call BOX
mov cx, 16
partA:
call TURN
partB:
call INPUT
call PLACE
cmp word[REPEAT],1
je partB
call OUTPUT
call Wincond
cmp word[over],0
jne endofgame
loop partA
endofgame:
call clrscr
call printresult
mov ax,0x4c00
int 0x21