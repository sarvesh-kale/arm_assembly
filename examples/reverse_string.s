 
@ comment your code 
@ this code extends the count string length program 
@ in this code we are going to reverse the string 
@ this code cannot read the white spaces in sentence 
@ declare in data section as you use in text section 
@ Author : Sarvesh Kale 

.data  @ data section 
.balign 4
msg1: .asciz "Enter the string to calculate length=\n"
.balign 4
scan: .asciz "%s"
.balign 4
string: .skip 100 
.balign 4
result: .asciz "The string length is %d\n"
.balign 4
char: .asciz "%c"

.text @ code section 
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
mov r0, #0

@ check if character at location is 0 (\0)
@ increment the string length 
@ increment pointer 
@ goto check character 

loop: 
	ldr r2, [r1]      @ load the character into r2
	and r2, r2, #255  
					  @ we are anding with 255 as we are interested in lowest byte of 4 bytes read 
					  @ ARM always reads 4 bytes at a time 
	cmp r2, #0
	beq end
	add r0, r0, #1 @ increment the length of string 
	add r1, r1, #1 @ increment the pointer to point to next character 
	b loop

end :  @ to exit the loop 
       @ r0 has the length of string 
       @ let r1 point to the string ]

ldr r1, =string
sub r2, r0, #1         
add r1, r1, r2          @ point to the end of string \0 as r0 is length of string so we decremnt it by 1 and put it into r2 
mov r2, r0              @ r2 has number of bytes in string 
reverse:                @ this loop prints the string in reverse 
		cmp r2, #0      
		beq end2 
		push {r0}
		push {r1}
		push {r2}
		ldr r3, [r1]    @ load the characters from last 
		and r3, r3, #255 @ we only want the lower byte 
		ldr r0, =char 
		mov r1, r3
		bl printf        @ printf modifies the r0 and r1 registers so we save them on stack earlier using push op 
		pop {r2}         @ those who are pushed last are popped first 
		pop {r1}
		pop {r0} 
			@ decrement the address 
		sub r1, r1, #1
			@ decrement the counter value 
		sub r2, r2, #1
		b reverse

end2:

pop {lr}
bx lr @ exit main 

.global printf 
.global scanf
