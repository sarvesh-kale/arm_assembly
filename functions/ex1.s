.data
.balign 4
msg: .asciz "input two numbers :- \n"
.balign 4
recv : .string "%d%d"
.balign 4
out: .asciz "sum is %d \n"
.balign 4
return : .word 0 
.balign 4
in1 : .word 0
.balign 4 
in2 : .word 0
.text 
.global main 
main :@ algo given below 
 	@ save lr into return 
	@ print msg to input 2 nums 
	@ call scanf and receive 2 nums 
	@ print their sum 
	@ restore lr 
	
	ldr r1,=return 
	str lr,[r1]
	
	@print msg 
	ldr r0, =msg 
	bl printf

	@call scanf (prepare inputs before) 	
	ldr r0, =recv  
	ldr r1, =in1
	ldr r2, =in2 
	bl scanf 

	@compute their sum
	ldr r1, =in1  @ these lines are necessary 
	ldr r2, =in2  
	ldr r0,[r1] @ get in1 at addr 
	ldr r1,[r2] @ get in2 at addr 
	bl sum      @ call func   
	
	@ print their sum 
	mov r1,r0  @ move out into r1 
	ldr r0, =out 
	@ r1 is prepared 
	bl printf 

	@restore lr 
	ldr r5, = return 
	ldr lr, [r5] 
	bx lr 
 
sum : @ this is a function 
	mov r2,#0 
	add r2, r0, r1 
	mov r0,r2
	bx lr 
.global printf 
.global scanf 

