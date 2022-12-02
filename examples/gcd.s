@ this program computes the gcd of two integers 
.data @ data segment of code 
.balign 4
return : .word 0 
.balign 4
number1: .word 0
.balign 4
number2: .word 0
.balign 4
msg1: .asciz "Enter two numbers => \n"
.balign 4
msg2: .asciz "gcd is %d\n"
.balign 4
scan: .asciz "%d%d"
.text @ code segment of code  
.global main 
main :
	@ store lr 
	ldr r0, =return 
	str lr,[r0]

	@ print msg 
	ldr r0, =msg1 
	bl printf 

	@ read numbers
	ldr r0, =scan 
	ldr r1, =number1
	ldr r2, =number2 
	bl scanf 

	@ call gcd 
	ldr r2, =number1 
	ldr r0, [r2]
	ldr r2, =number2 
	ldr r1, [r2]
	bl gcd 

	@ print gcd recvd 
	mov r1, r0 
	ldr r0, =msg2 
	bl printf
	
	@restore lr 
	ldr r0, =return 
    ldr lr, [r0]

	@end main 
	bx lr 

gcd :
	@ cmp r0 to 1 if 1 then r1 is answer 
	@ store lower value in r0 
	@ do rem = r1%r0 
	@ r1=r0 r0=rem 
	@ go to step 1 
	@
	loop : 
	cmp r0, #0 
	beq end 
	@ code if not equal 
	udiv r3, r1, r0
	mul r4, r3, r0
	sub r5, r1, r4 @ above three lines do a % b 
				   @ r5 has remainder
	mov r1, r0     @ copy bigger number to r1 
	mov r0, r5	   @ mov remainder to r0 that becomes smaller number now
	b loop         @ to go step 1 
	@
	end :
	mov r0, r1
	@
	bx lr          @ return from gcd function  
	
.global printf 
.global scanf 



