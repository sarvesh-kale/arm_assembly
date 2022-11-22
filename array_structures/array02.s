/*
program similar to array01.s 
except addressing modes is changed 
*/

.data 
a : .skip 400 

.text 
.global main 
main :
	@ use r0 as base addr
	@ use r1 are counter var 
	@ 
	ldr r0, =a 
	mov r1, #0 
	
	loop :
	cmp r1, #100
	beq end 
	str r1,[r0,+r1,lsl #2] 
	add r1, r1, #1
	b loop 
	end :
	bx lr 

