.data
.balign 4
msg: .asciz "input two numbers :- \n"
.balign 4
recv : .asciz "%d%d"
.balign 4
return : .word 0 
.balign 4
in1 : .word 0
in2 : .wrod 0
.text 
.global main 
main :
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
	ldr r0, =msg 
	ldr r1, =in1
	ldr r2, =in2 
	bl scanf 

	@print their sum 
.glbal printf 
.global scanf 

