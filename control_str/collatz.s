.text 
.global main 
/*
tips on writing assembly 
write pseudo code and then 
find asm instruction(s) to replace the line 
its that easy !!
*/
main : 
	@ load number 
	@ check number not eq 1
	@ if even divide by 2 
	@ if odd 3*no + 1 
	@ go to step 1 
	mov r0, # 23 
	while_cond:
	cmp r0, #1
	beq end_while 
	/* write while body here */
	
	if_cond:
	and r1, r0, #1 
	cmp r1, #1 
	beq then   
	lsr r0,#1
	b end_if 

	then:             @ if part 
	add r0, r0, lsl #1
	add r0, #1 

	end_if:
	b while_cond 	
	end_while :
	
	bx lr 

