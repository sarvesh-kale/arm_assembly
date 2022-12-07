@ this computes the fibonacci numbers in assembly 
@ always have assembly codes commented 
@ you can revisit and understand them 
@ 
.data 

.balign 4
msg1:        .asciz "Enter which Fibonacci number you want=\n"
.balign 4
msg2:        .asciz "%d"
.balign 4
num: .word 0 
.balign 4
result: .asciz "The Fibonacci number is %d\n"

.text 
.global main
main :
@ save lr

push {lr}

@ print string to recv inp 

ldr r0, =msg1
bl printf 

@ take input 

ldr r0, =msg2 
ldr r1, =num
bl scanf 

@ compute fibonacci without function 
@ init r0 and r1 to 1, 1 init r3=2 

 mov r0, #1 
 mov r1, #1 
 mov r3, #2 
 ldr r5, =num
 ldr r4, [r5] @ r4 has the nth fibo index input from user 

@ if num is 1 or 2 return 1 
 
 cmp r4, #2
 bgt loop
 mov r1, #1
 b resultprint

@ else r2=r0+r1 ; r0=r1 and r1=r2 ;  
 
 loop: 
	cmp r4, #2
	beq resultprint
	add r2, r0, r1
	mov r0, r1
	mov r1, r2
	sub r4, r4, #1
	b loop 

@ print result

resultprint:
ldr r0, =result
		@ r1 has result stored 
bl printf 

@ restore lr 

pop {lr}

@ end 

bx lr 

.global printf 
.global scanf 
