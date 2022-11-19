.text 
.global main 
main : 
	@ r0 is sum reg init to 0 
	@ r1 goes frm 1 to n eg (10)
	@ r1 < 10 
	@ r0 = r0 + r1 
	@ r1 = r1 + 1 and close the loop 
	mov r0, #0 @ initialized 
	mov r1, #1 
	while_cond : 
	cmp r1, #22 
	bgt end_while 
	
	@ perform while loop operations here 
	add r0, r0, r1 @ perform cumulative sum 
	add r1, r1, #1 @ increments r1 
	b while_cond 
	end_while :

	bx lr @ end the program 

