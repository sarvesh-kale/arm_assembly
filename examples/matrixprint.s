@ this code prints matrix in rectangular form 
@ to change the matrix entries change the entries in the data section  
@ 

.data @ data section  
.balign 4
entries : .word 12,-4,23,12,11,33,42,23,22
.balign 4
printRow: .asciz "%d %d %d\n"

.text @ text section of code  
.global main 
main :
	@ save lr
	push {lr}

	@ read matrix address 
	ldr r4, =entries

	@ enter for loop to print 3 rows 
	mov r5, #0 
	@ r5 acts as loop variable 

	loop:
		cmp r5, #3 @ break if equal 
		beq endLoop
		push {r4}
		push {r5} @ push the regs to stack which you feel might change after function execution 
		@ prepare inputs for printf function 
		ldr r0, =printRow
		ldr r1, [r4]
		ldr r2, [r4,#4]
		ldr r3, [r4,#8]
		bl printf 
		@ increment the address
		
		@ restore 
		pop {r5}
		pop {r4}

		add r4, #12 @ point to next row 
		@ increment loop var 
		add r5, r5, #1
		b loop      @ this completes the loop 
	endLoop:

	@ restore lr 
	pop {lr}

	@ end 
	bx lr 

