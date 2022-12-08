@ 
@ comment your code 
@ this code computes the string length entered by user 
@ declare in data section as you use in text section 
@ Author : Sarvesh Kale 

.data 

.balign 4
msg1: .asciz "Enter the string to calculate lenght=\n"
.balign 4
scan: .asciz "%s"
.balign 4
string: .skip 100 
.balign 4
result: .asciz "The string length is %d\n"

.text 

.global main 
main : @ entry point 
@ save lr 
push {lr}

@ print msg what user should do ?
ldr r0, =msg1 
bl printf 

@ scan input 
ldr r0, =scan
ldr r1, =string 
bl scanf 

@ load the address of string inputed to register 
ldr r1, =string
mov r0, #0 @ r0 will keep the count of the string 


@ check if character at location is 0 (\0)
@ increment the string length 
@ increment pointer 
@ goto check character 

loop: 
	ldr r2, [r1] @ load the character into r2
	and r2, r2, #255 @ we are anding with 255 as we are interested in lowest byte of 4 bytes read 
					 @ ARM always reads 4 bytes at a time 
	cmp r2, #0
	beq end
	add r0, r0, #1 @ increment the length of string 
	add r1, r1, #1 @ increment the pointer to point to next character 
	b loop

end :  @ to exit the loop 
@ print the length of string 
mov r1, r0
ldr r0, =result 
bl printf 
nop         

pop {lr}
bx lr @ exit main 

.global printf 
.global scanf 
