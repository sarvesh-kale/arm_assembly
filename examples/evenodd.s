.data

.balign 4
input : .asciz "Enter a number : "
.balign 4 
scan : .asciz "%d"
.balign 4 
number: .word 0
.balign 4
outeven : .asciz "Even number \n"
.balign 4 
outodd : .asciz "Odd number \n "

.text @ text section of code  
.global main 
main : 
	@ save lr 
	push {lr}

	@ take input 
	ldr r0, =input 
	bl printf 

	ldr r0, =scan 
	ldr r1, =number 
	bl scanf 

	@ and with 1
	ldr r1, =number 
	ldr r2, [r1]
	and r2, r2, #1 @ check if lsb is 1
	cmp r2, #1     @ 
	blt evenprint  @ if lsb is 0 jmp to outeven tag 
	@ else part 
	ldr r0, =outodd 
	bl printf      @ prints odd here 
	b end          @ jmp to end to exit main 

evenprint :
	ldr r0, =outeven 
	bl printf 
	
end : 
	@ pop lr or restore it 
	pop {lr}
	bx lr          @ end main  
