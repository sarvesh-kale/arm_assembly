@ the assembly program below swaps two numbers 
.data 
.balign 4
inp_string: .asciz "Enter two numbers\n"
.balign 4
scan: .asciz "%d%d"
.balign 4
return: .word 0
.balign 4
num1 : .word 0
.balign 4
num2: .word 0

.text 
.global main 
main :
	@ save lr
	ldr r0, =return 
	str lr, [r0]

	@ print msg
	ldr r0, =inp_string
	bl printf @ this will print the message pointed by r0 

	@ scan inp 
    ldr r0, =scan 
	ldr r1, =num1
	ldr r2, =num2 
	bl scanf 

	@ call swap 
	ldr r2, =num1 @ load r0 and r1 with numbers received 
	ldr r0, [r2] 
	ldr r2, =num2
	ldr r1, [r2]
	bl swap 

	@ restore lr
	ldr r2, =return 
	ldr lr, [r2]

	@ end 
	bx lr 

swap :
	mov r3, r0
	mov r0, r1
	mov r1, r3
	bx lr @ return from swap  

.global printf 
.global scanf 
