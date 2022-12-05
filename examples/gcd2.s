@ always write pseudo code and then convert to assembly 

.data 

.balign 4
msg1 : .asciz "Enter 2 numbers =>\n"
.balign 4
out : .asciz "GCD is %d\n"
.balign 
scan: .asciz "%d%d"
.balign 4
num1: .word 0
.balign 4
num2: .word 0

.text 
.global main 
main:
	@ save lr 
	push {lr}
	
	@ print msg 
	ldr r0, =msg1 
	bl printf 

	@ enter two numbers 
	ldr r0, =scan 
	ldr r1, =num1 
	ldr r2, =num2 
	bl scanf 
	
	@ call gcd 
	bl gcd

	@ print gcd 
	ldr r0, =out 
	bl printf 

	@ restore lr 
	pop {lr}

	@ end 
	bx lr 	

@ gcd is a function 
gcd : 
@ let a and b two numbers 
@ a>b, do r=a-b 
@ if r == 0 return a 
@ else a=b and b=r
@ repeat 
	ldr r1, =num1
	ldr r2, =num2 @ reload the addresses of numbers in r1 and r2 
	ldr r0, [r1]
	ldr r1, [r2] @ our inputs to work with 
	
	@ assume r0>r1
loop:	
	cmp r0, r1
	bgt steps
	mov r3, r0
	mov r0, r1
	mov r1, r3   @ swap r0, r1 if r0<r1 

	bgt steps 
	bx lr        @ return from gcd condition 
				 @ r1 is the result used directly into r0 

	steps :
		sub r2, r0, r1
		mov r0, r1
		mov r1, r2 
		b loop

.global printf 
.global scanf 
