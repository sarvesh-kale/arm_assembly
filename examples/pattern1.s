@ this code prints a triangle pattern 
@ Write code to print the triangle for first 5 lines and generalize next 
@ 
.data 
.balign 4
star: .asciz "*"
.balign 4
nxtLine: .asciz "\n"

.text 
.global main 
main :
	@ save lr 
	push {lr}

	@ init var for looping
	mov r5, #1 @ using r5 as loop variable as it is not modified by return of printf

	@ call print on star as many times as line number
	loop1:
		cmp r5, #100       @ this statement has to be changed to make generalized 
		bgt endloop1
		mov r6,#1
		
		loop2:
			cmp r6, r5
			bgt endloop2
			@ prepare to call printf 
			ldr r0, =star 
			bl printf
			add r6, r6, #1 @ increment the inner loop counter 
			b loop2        @ jump to beginning of innner loop2 
		endloop2:
		
		@ enter a new line character 
		ldr r0, =nxtLine 
		bl printf
		@ increment outer loop variable 
		add r5, r5, #1 @ increment by 1 
		b loop1 
	endloop1:

	@ go to next line 
	@ end after 5 iterations 
	@ print a newline
	ldr r0, =nxtLine 

	@ restore lr 
	pop {lr}

	@ end 
	mov r1, #1 
	svc 1 

