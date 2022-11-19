.data 
.balign 4
myvar1: 
	.word 0
myvar2: 
	.word 0

.text 
.balign 4
.global main 
.func main 
main : 
	ldr r1, =myvar1 
	mov r3, #23
	str r3, [r1]
	ldr r1, [r1]

	ldr r2, =myvar2 
	mov r3 , #42
	str r3, [r2]
	ldr r2, [r2]
	
	add r0, r1, r2
	bx lr 




