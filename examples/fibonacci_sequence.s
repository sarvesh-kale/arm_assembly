@ this is modification of fibonacci.s 
@ this computes the fibonacci sequence to the index input by user 
@ always have assembly codes commented 
@ you can revisit and understand them 
@ call the code to compute fibonacci repeatdely 

.data 

.balign 4
msg1:        .asciz "Enter upto which  Fibonacci number you want sequence printed =\n"
.balign 4
msg2:        .asciz "%d"
.balign 4
num: .word 0 
.balign 4
result: .asciz "%4d\n"

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

 mov r0, #0 
 mov r1, #1 
 ldr r5, =num
 ldr r4, [r5] @ r4 has the nth fibo index input from user 

@ write algorithm here  
@ compare loop counter and end if =0 
@ save r0, r1 as modified by subsequent function 
@ print r1 
@ restore the contents of r0, r1 back 
@ do c=a+b; a=b; b=c; decrement counter; go to step 1 

 loop: 
	cmp r4, #0
	beq end
	push {r0}       @ call to printf modifies r0 and r1
	push {r1}
	ldr r0, =result @ point to string that prints the number 
	bl printf       @ print result
	pop {r1}
	pop {r0}        @ restore the r0 content and r1 content 
	add r2, r0, r1
	mov r0, r1
	mov r1, r2
	sub r4, r4, #1
	b loop 

@ restore lr 

end :
pop {lr}

@ end 

bx lr 

.global printf 
.global scanf 
