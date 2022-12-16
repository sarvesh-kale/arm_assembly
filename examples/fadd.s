.data @data section

.balign 4
read: .string "%f%f"
.balign 4
input : .string "Enter two float numbers \n"
.balign 4
num1: .word 0
.balign 4
num2: .word 0
.balign 4
num3: .word 0
.text @ code secion  
.global main 
main :
		push {lr}
		
		ldr r0, =input 
		bl printf 

		ldr r0, =read @ read the floating point numbers 
		ldr r1, =num1 
		ldr r2, =num2 
		bl scanf
		
		ldr r3, =num1
		vldr s1, [r3]  @ store the values read in registers 

		ldr r3, =num2 
		vldr s2, [r3]
		
		
		vadd.f32 s1, s2 @ do floating point add

		@ examine s1 in gdb it will contain the result of addition 	

		pop {lr}            @ restore lr  
		bx lr @ end  

